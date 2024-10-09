
 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /inst_mem_kvdd_vdd25_tb/status
      waveform add -signals /inst_mem_kvdd_vdd25_tb/inst_mem_kvdd_vdd25_synth_inst/bmg_port/CLKA
      waveform add -signals /inst_mem_kvdd_vdd25_tb/inst_mem_kvdd_vdd25_synth_inst/bmg_port/ADDRA
      waveform add -signals /inst_mem_kvdd_vdd25_tb/inst_mem_kvdd_vdd25_synth_inst/bmg_port/ENA
      waveform add -signals /inst_mem_kvdd_vdd25_tb/inst_mem_kvdd_vdd25_synth_inst/bmg_port/DOUTA
      waveform add -signals /inst_mem_kvdd_vdd25_tb/inst_mem_kvdd_vdd25_synth_inst/bmg_port/CLKB
      waveform add -signals /inst_mem_kvdd_vdd25_tb/inst_mem_kvdd_vdd25_synth_inst/bmg_port/ADDRB
      waveform add -signals /inst_mem_kvdd_vdd25_tb/inst_mem_kvdd_vdd25_synth_inst/bmg_port/ENB
      waveform add -signals /inst_mem_kvdd_vdd25_tb/inst_mem_kvdd_vdd25_synth_inst/bmg_port/DOUTB
console submit -using simulator -wait no "run"
