#include "RTG_Calc_main.h"

int main(){
    cout<< "Hello, are you on Jacob's Computer?"<<endl;
    cin >> response;
    if(response == "Da"){
        cout<<endl<<"Hello Jacob. Welcome Back!"<<endl;
        responseV = true;
    }
    else{
        cout<<"You are not Jacob."<<endl;
        responseV = false;
    }
    numElements = 0; // initialize number of elements from input
    // Set Constants
    J_conv = 1.60218*pow(10,-13);
    Na = 6.023* pow(10,23);
    // Open Input File
    if(responseV){
        filename = "/Users/jbickus/C_Plus_codes/exec/RTG_Elements.txt";
    }
    else{
        filename = "RTG_Elements.txt";
    }
    ifstream inFile(filename);
    if (!inFile){//check to insure file opens
        cerr << "Unable to open file RTG_Elements.txt.";
        exit(1);
        return EXIT_FAILURE;
    }
    while(inFile && !inFile.eof()){
        inFile.ignore(100, '\n');
        inFile >> ELEMENT>>M>>grams>>time_period>>INCREMENT;
        ++numElements;
        ELEMENTV.push_back(ELEMENT);
        gramsV.push_back(grams);
        MV.push_back(M);
        time_periodV.push_back(time_period);
        INCREMENTV.push_back(INCREMENT);

    }
    inFile.close();
    numElements = numElements -1;
    cout<<"Number of Elements Found "<<numElements<<endl;
    if(numElements == 0){
        cout<<"FATAL ERROR"<<"Number of Elements Cannot be Zero"<<endl<<"Check RTG_Elements.txt for Errors"<<endl;
        return EXIT_FAILURE;
    }
    
    /* Open element.txt */
    if(responseV){
        filename = "/Users/jbickus/C_Plus_codes/exec/element.txt";
    }
    else{
        filename = "element.txt";
    }
    inFile.open(filename);
    if(!inFile){
        cerr << "Unable to open file element.txt";
        exit(1);
    }
    // read file in only once
    while(inFile>>read_file_str){
        data.read_file.push_back(read_file_str);
    }
    inFile.close();
    
    /* Begin Timing and Open File to Write RTG_Calc.dat */
    
    auto start = high_resolution_clock::now();
    ofstream outdata; //outdata is like cin

    for(int i=0;i<numElements;i++){// Loops over number of elements

        if(INCREMENTV[i] == "days"){
            ITERATOR = 1; // update every minute
            time_periodV[i] = time_periodV[i]*1440;
        }
        else if(INCREMENTV[i] == "months"){
            ITERATOR = 60; // update every hour
            time_periodV[i] = time_periodV[i]*43800;
        }
        else if(INCREMENTV[i] == "years"){
            if(time_periodV[i] < 50){
            ITERATOR = 1440; // update every day
            time_periodV[i] = time_periodV[i]*525600;
            }
            else{
                ITERATOR = 43800; // Update every month
                time_periodV[i] = time_periodV[i]*525600;
            }
        }
        else{
            cerr << "ERROR: Must Choose Units days, months, years"<<endl<<"Calculation could be INCORRECT"<<endl;
            return EXIT_FAILURE;
        }
        this_time_period = time_periodV[i]/ITERATOR;
        cout<<"Calculating "<<this_time_period<<" iterations over your time period "<<time_periodV[i]<<" minutes."<<endl;
    // Set Up Time array
        for(unsigned int j=0;j<=this_time_period;j++){
            time_period_array.push_back(j*ITERATOR);
            time_period_array.at(j);
            //cout<<time_period_array[j]<<endl; //check
        }

    /* Read Half-lives and React E from elements.txt file  */
        E_name = ELEMENTV[i] + to_string(MV[i]);
        filename = E_name + ".dat";
        if(responseV){
            filename = "/Users/jbickus/C_Plus_codes/Out_Files/" + E_name + ".dat";
            outdata.open(filename); //opens the file in my specified directory
            
        }
        else{
            filename = E_name + ".dat";
            outdata.open(filename);
        }
        if( !outdata ) {//file couldn't be opened
            cerr << "Error: file could not be opened" << endl;
            exit(1);
            return EXIT_FAILURE;
        }
        for(int j=0;j<data.read_file.size();j++){
            if(data.read_file[j] == E_name){
                for(int i=j+1;i<data.read_file.size();i++){
                    //cout << i << endl;
                    if(data.read_file[i] != "NEXT"){
                        data.read_file_list.push_back(data.read_file[i]);
                    }
                    else{
                        break;
                    }
                }
            }
        }
        if(data.read_file_list.empty()){
            cerr<<"ERROR Element Not Found."<<endl<<"Check and Update RTG_Elements.txt."<<endl<<"Check and Update element.txt library."<<endl<< "Calculations could be INCORRECT!"<<endl;
            return EXIT_FAILURE;
        }

        // Seperate data into half life and Q value
        SEPERATE_DATA(data);

        // Resize half life and react_E vectors
        half_life.resize(half_life_list.size());
        react_E.resize(half_life_list.size());
        
        // Convert strings from file into floats for math use
        for(int i=0;i<half_life_list.size();i++){
            half_life[i] =stof(half_life_list[i]);
            react_E[i] = stof(react_E_list[i]);
            //cout<<i<<" "<<half_life[i]<<endl; //check
        }
        cout<<"Isotope Found: "<<E_name<<endl;
        N_initial = (gramsV[i]*Na)/MV[i];
        Daughters = half_life.size(); //including PU
        cout<<"Isotope "<<E_name<<" has "<<Daughters<<" Daughter Product[s]."<<endl;
        lambda.resize(half_life.size());
        for(int j=0;j<half_life.size();j++){
            lambda[j] = (log(2) / half_life[j]);
            //cout<<lambda[j]<<endl;
        }
    
    // Resize all vectors to the size of time period array size
        Act_1.resize(time_period_array.size());
        Act_2.resize(time_period_array.size());
        POWER_1.resize(time_period_array.size());
        POWER_2.resize(time_period_array.size());
        TPOWER.resize(time_period_array.size());
        
    /* Determine Parent Activity */
        Act_1[0]=0;
        for(unsigned long long int j=1;j<this_time_period;j++){
            Act_1[j] = lambda[0]*N_initial*exp(-lambda[0]*time_period_array[j]);
            POWER_1[j] = J_conv*react_E[0]*Act_1[j]/60; // units W
            if(Daughters <= 1){
                outdata<<POWER_1[j] <<endl;
                //cout<<lambda[0]<<endl;
                //cout<<POWER_1[j]<<endl;
            }
        }
        if(Daughters <= 1){
            outdata.close();
        }
        //cout<<Act_1[1]<<endl<<lambda[0]<<endl<<time_period_array[1]<<endl;
    //Determine Daughters
        if(Daughters > 1){
            for(unsigned long long int j=1;j<this_time_period;j++){
                if(half_life[0] > half_life[1]+525600){ // secular equilibrium
                    Act_2[j] = Act_1[j]*(1-exp(-lambda[1]*time_period_array[j]));
                }
                else if(half_life[0] < half_life[1]+525600){ //transient equilibrium
                    Act_2[j] = lambda[1]*Act_1[j]/(lambda[1] - lambda[0]);
                }
                POWER_2[j] = J_conv*react_E[1]*Act_2[j]/60; //units W
                TPOWER[j] = POWER_1[j] + POWER_2[j];
            }
            
            if(Daughters < 3){
                for(unsigned long long int k=1;k<this_time_period;k++){
                    outdata<<TPOWER[k]<<endl;
                }
                outdata.close();
            }
            else if(Daughters > 3){
                for(unsigned long long int k=2;k<Daughters;k++){
                    Act_1 = Act_2;
                    POWER_1 = TPOWER;
                    for(unsigned long long int j=1;j<this_time_period;j++){
                        if(half_life[k] > half_life[k+1]+525600){
                            Act_2[j] = Act_1[j]*(1-exp(-lambda[k]*time_period_array[j]));
                        }
                        else if(half_life[k] < half_life[k+1]+525600){
                            Act_2[j] = lambda[1]*Act_1[j]/(lambda[k] - lambda[k-1]);
                        }
                    POWER_2[j] = J_conv*react_E[k]*Act_2[j]/60; //unit W
                    TPOWER[j] = POWER_1[j] + POWER_2[j];
                    }
                }
                for(unsigned long long int j=1;j<this_time_period;j++){
                    outdata<<TPOWER[j]<<endl;
                }
                outdata.close();
            }
        }
        
    
        //Reset all vectors
        RESET_V();
        cout<<endl<<"Power[W] has been calulated and tabulated in "<<E_name<<".dat"<<endl;
    }

    

    auto stop = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(stop - start);
    float durationTime = duration.count()/1000000.0;
    cout << "Run Duration: " << durationTime << "seconds"<<endl<<endl;
    
    
    return 0; // for int main
}
