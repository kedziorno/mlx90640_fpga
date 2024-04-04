void MLX90640_CalculateTo(uint16_t *frameData, const paramsMLX90640 *params, float emissivity, float tr, float *result)
{
    float vdd;
    float ta;
    float ta4;
    float tr4;
    float taTr;
    float gain;
    float irDataCP[2];
    float irData;
    float alphaCompensated;
    uint8_t mode;
    int8_t ilPattern;
    int8_t chessPattern;
    int8_t pattern;
    int8_t conversionPattern;
    float Sx;
    float To;
    float alphaCorrR[4];
    int8_t range;
    uint16_t subPage;
    float ktaScale;
    float kvScale;
    float alphaScale;
    float kta;
    float kv;
    
    subPage = frameData[833];
    vdd = MLX90640_GetVdd(frameData, params);
    ta = MLX90640_GetTa(frameData, params);
    
    ta4 = (ta + 273.15);
    ta4 = ta4 * ta4;
    ta4 = ta4 * ta4;
    tr4 = (tr + 273.15);
    tr4 = tr4 * tr4;
    tr4 = tr4 * tr4;
    taTr = tr4 - (tr4-ta4)/emissivity;
    
    ktaScale = POW2(params->ktaScale);
    kvScale = POW2(params->kvScale);
    alphaScale = POW2(params->alphaScale);
    
    alphaCorrR[0] = 1 / (1 + params->ksTo[0] * 40);
    alphaCorrR[1] = 1 ;
    alphaCorrR[2] = (1 + params->ksTo[1] * params->ct[2]);
    alphaCorrR[3] = alphaCorrR[2] * (1 + params->ksTo[2] * (params->ct[3] - params->ct[2]));
    
//------------------------- Gain calculation -----------------------------------    
    
    gain = (float)params->gainEE / (int16_t)frameData[778]; 
  
//------------------------- To calculation -------------------------------------    
    mode = (frameData[832] & MLX90640_CTRL_MEAS_MODE_MASK) >> 5;
    
    irDataCP[0] = (int16_t)frameData[776] * gain;
    irDataCP[1] = (int16_t)frameData[808] * gain;
    
    irDataCP[0] = irDataCP[0] - params->cpOffset[0] * (1 + params->cpKta * (ta - 25)) * (1 + params->cpKv * (vdd - 3.3));
    if( mode ==  params->calibrationModeEE)
    {
        irDataCP[1] = irDataCP[1] - params->cpOffset[1] * (1 + params->cpKta * (ta - 25)) * (1 + params->cpKv * (vdd - 3.3));
    }
    else
    {
      irDataCP[1] = irDataCP[1] - (params->cpOffset[1] + params->ilChessC[0]) * (1 + params->cpKta * (ta - 25)) * (1 + params->cpKv * (vdd - 3.3));
    }

    for( int pixelNumber = 0; pixelNumber < 768; pixelNumber++)
    {
        ilPattern = pixelNumber / 32 - (pixelNumber / 64) * 2; 
        chessPattern = ilPattern ^ (pixelNumber - (pixelNumber/2)*2); 
        conversionPattern = ((pixelNumber + 2) / 4 - (pixelNumber + 3) / 4 + (pixelNumber + 1) / 4 - pixelNumber / 4) * (1 - 2 * ilPattern);
        
        if(mode == 0)
        {
          pattern = ilPattern; 
        }
        else 
        {
          pattern = chessPattern; 
        }               
        
        if(pattern == frameData[833])
        {    
            irData = (int16_t)frameData[pixelNumber] * gain;
            
            kta = params->kta[pixelNumber]/ktaScale;
            kv = params->kv[pixelNumber]/kvScale;
            irData = irData - params->offset[pixelNumber]*(1 + kta*(ta - 25))*(1 + kv*(vdd - 3.3));
            
            if(mode !=  params->calibrationModeEE)
            {
              irData = irData + params->ilChessC[2] * (2 * ilPattern - 1) - params->ilChessC[1] * conversionPattern; 
            }                       
    
            irData = irData - params->tgc * irDataCP[subPage];
            irData = irData / emissivity;
            
            alphaCompensated = SCALEALPHA*alphaScale/params->alpha[pixelNumber];
            alphaCompensated = alphaCompensated*(1 + params->KsTa * (ta - 25));
                        
            Sx = alphaCompensated * alphaCompensated * alphaCompensated * (irData + alphaCompensated * taTr);
            Sx = sqrt(sqrt(Sx)) * params->ksTo[1];            
            
            To = sqrt(sqrt(irData/(alphaCompensated * (1 - params->ksTo[1] * 273.15) + Sx) + taTr)) - 273.15;                     
                    
            if(To < params->ct[1])
            {
                range = 0;
            }
            else if(To < params->ct[2])   
            {
                range = 1;            
            }   
            else if(To < params->ct[3])
            {
                range = 2;            
            }
            else
            {
                range = 3;            
            }      
            
            To = sqrt(sqrt(irData / (alphaCompensated * alphaCorrR[range] * (1 + params->ksTo[range] * (To - params->ct[range]))) + taTr)) - 273.15;
                        
            result[pixelNumber] = To;
        }
    }
}
