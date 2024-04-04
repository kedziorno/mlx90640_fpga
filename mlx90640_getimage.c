void MLX90640_GetImage(uint16_t *frameData, const paramsMLX90640 *params, float *result)
{
    float vdd;
    float ta;
    float gain;
    float irDataCP[2];
    float irData;
    float alphaCompensated;
    uint8_t mode;
    int8_t ilPattern;
    int8_t chessPattern;
    int8_t pattern;
    int8_t conversionPattern;
    float image;
    uint16_t subPage;
    float ktaScale;
    float kvScale;
    float kta;
    float kv;
    
    subPage = frameData[833];
    vdd = MLX90640_GetVdd(frameData, params);
    ta = MLX90640_GetTa(frameData, params);
    
    ktaScale = POW2(params->ktaScale);
    kvScale = POW2(params->kvScale);
    
//------------------------- Gain calculation -----------------------------------    
    
    gain = (float)params->gainEE / (int16_t)frameData[778]; 
  
//------------------------- Image calculation -------------------------------------    
    
    mode = (frameData[832] & MLX90640_CTRL_MEAS_MODE_MASK) >> 5;
    
    irDataCP[0] = (int16_t)frameData[776] * gain;
    irDataCP[1] = (int16_t)frameData[808] * gain;
    
    irDataCP[0] = irDataCP[0] - params->cpOffset[0] * (1 + params->cpKta * (ta - 25)) * (1 + params->cpKv * (vdd - 3.3)); // pixoscpsp0
    if( mode ==  params->calibrationModeEE)
    {
        irDataCP[1] = irDataCP[1] - params->cpOffset[1] * (1 + params->cpKta * (ta - 25)) * (1 + params->cpKv * (vdd - 3.3)); // pixoscpsp1
    }
    else
    {
      irDataCP[1] = irDataCP[1] - (params->cpOffset[1] + params->ilChessC[0]) * (1 + params->cpKta * (ta - 25)) * (1 + params->cpKv * (vdd - 3.3)); // pixoscpsp1
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
            irData = (int16_t)frameData[pixelNumber] * gain; // pixgain = ram[] * gain
            
            kta = params->kta[pixelNumber]/ktaScale;
            kv = params->kv[pixelNumber]/kvScale;
            irData = irData - params->offset[pixelNumber]*(1 + kta*(ta - 25))*(1 + kv*(vdd - 3.3)); 
            
            if(mode !=  params->calibrationModeEE)
            {
              irData = irData + params->ilChessC[2] * (2 * ilPattern - 1) - params->ilChessC[1] * conversionPattern; 
            }
            
            irData = irData - params->tgc * irDataCP[subPage];
                        
            alphaCompensated = params->alpha[pixelNumber];
            
            image = irData*alphaCompensated;
            
            result[pixelNumber] = image;
        }
    }
}
