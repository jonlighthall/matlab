textPi='3.141592653589793238462643383279502884197169399375105820974944592';
len=length(textPi);

NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;

for i=1:len
    inputText=textPi(1:i);
    if ~(i==2)
        if(i>2)
            preText=sprintf('The first %d digits of pi are ',i-1);
        else
            preText=sprintf('The first digit of pi is ');
        end
        inputText=strcat(preText,' ',inputText);
        fprintf('%d %s\n',i,inputText);
        Speak(obj, inputText);
    end
end