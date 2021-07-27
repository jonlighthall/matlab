NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;

% inputText ='fart';

for i=1:5
    inputText ='fart';
    
    fprintf('%d %s\n',i,inputText);
    Speak(obj, inputText);
    
    
end