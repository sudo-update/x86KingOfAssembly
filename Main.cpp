#include <stdio.h>
#include <cstdlib>
#include <iostream>

extern "C" double interview(char name[], double expected_salary);
// void printName(char name[50]) {
//   for (int i=0; i<50; i++) {
//     std::cout << name[i];
//   }
// }
int main (int argc, char* argv[]) {
  char name[50] = "";
  double result_after_interview = 1.0;
  double expected_salary = 0.0;
  std::cout << "Welcome to Software Analysis by Paramount Programmers, Inc.\n"
               "Please enter your first and last names and press enter: ";
  std::cin.getline(name, 50);
  std::string string_name(name);
  std::cout << "Thank you ";
  std::cout << string_name;
  std::cout << ".\nOur records show that you applied for "
               "employment here with our agency a week ago.\nPlease enter your "
               "expected annual salary when employed at Paramount: ";
  std::cin >> expected_salary;
  std::cout << std::endl;
  result_after_interview = interview(name, expected_salary);
  if (result_after_interview == 1000000.00) {
    std::cout << "Thank you Mr. Sawyer.  I am the receptionist.\n"
              << "This envelope has your job offer starting at 1 million annual."
              << "\nPlease start anytime you like.  In the meantime, our CTO\n"
              << "wishes to have dinner with you.  Have a wonderful day, Mr. Sawyer.\n";
  }
  if (result_after_interview == 1200.12) {
    std::cout << "Hello ";
    std::cout << string_name;
    std::cout << ". I am the receptionist.  We have an opening for you in the\n"
              << "company cafetieria for $1,200.12 annually.\n"
              << "Take your time to let us know your decision.\n"
              << "Bye.\n";
  }
  if (result_after_interview == 88000.88) {
    std::cout <<"Hello ";
    std::cout << string_name;
    std::cout << ". I am the receptionist.  This envelope contains your job offer\n"
              << "with a starting salary of $88,000.88 annually.\n"
              << "Please check back on Monday morning at 8:00AM.\n"
              << "Bye.\n";
  }
  return 0;
}
