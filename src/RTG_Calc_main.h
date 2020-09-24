#include <array>
#include <vector>
#include <cmath>
#include <iostream>
#include <chrono>
#include <string>
#include <iterator>

using namespace std;
using namespace std::chrono;
using std::cerr;
using std::endl;
#include <fstream>
using std::ofstream;
using std::ifstream;
#include <cstdlib> // for exit function

// Declare Vectors used
vector<unsigned long long int> time_period_array;
vector<float> lambda;
// Declare Activity Arrays
vector<double> Act_1;
vector<double> Act_2;
// Declare Other Variables
float Na;
float N_initial;
int ITERATOR;
unsigned short int Daughters;
unsigned long long int this_time_period;
unsigned long long int count;
string E_name;
string filename;
string response;
bool responseV;

//These will be for elements.txt file
vector<string> half_life_list;
vector<string> react_E_list;
vector<float> half_life;
vector<float> react_E;
string read_file_str;
// These will be inputs
string ELEMENT;
string INCREMENT;
unsigned short int time_period;
float grams;
unsigned short int numElements;
unsigned short int M;
// These will be input vectors
vector<string> ELEMENTV;
vector<unsigned long long int> time_periodV;
vector<float> gramsV;
vector<string> INCREMENTV;
vector<unsigned short int> MV;
// These are for the Power calculation
float J_conv;
vector<float> POWER_1;
vector<float> POWER_2;
vector<float> TPOWER;

/* Declare Structures here */

struct E_data{
    vector<string> read_file;
    string read_half_life;
    string read_react_E;
    vector<string> read_data_list;
    vector<string> read_file_list;
};

E_data data; // declare object from E_data

/* Declare Functions here */
void SEPERATE_DATA(E_data);
void RESET_V();

/* Function Descriptions below */

void SEPERATE_DATA(E_data data){
    for(int i=0;i<data.read_file_list.size();i+=2){
        half_life_list.push_back(data.read_file_list[i]);
    }
    for(int i=1;i<data.read_file_list.size();i+=2){
        react_E_list.push_back(data.read_file_list[i]);
    }
}

void RESET_V(){
    count = 0;
    while(!half_life.empty()){
        count++;
        half_life.pop_back();
    }
    count =0;
    while(!react_E.empty()){
        count++;
        react_E.pop_back();
    }
    count =0;
    while(!half_life_list.empty()){
        count++;
        half_life_list.pop_back();
    }
    count =0;
    while(!react_E_list.empty()){
        count++;
        react_E_list.pop_back();
    }
    count =0;
    while(!data.read_file_list.empty()){
        count++;
        data.read_file_list.pop_back();
    }
    count =0;
    while(!time_period_array.empty()){
        count++;
        time_period_array.pop_back();
    }
}






