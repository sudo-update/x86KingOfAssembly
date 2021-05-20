// *****************************************************************************
// Program name: "KingOfAssembly".  This program simulates a job interview at
// Paramount Programmers, Inc.  The interviewee is prompted for their name and
// expected salary.  Special treatment is reserved for Chris Sawyer.  The
// interviewee is tested on basic circuit resistance.  They are then asked what
// their major was during college.  This determines their starting salary offer.
// Copyright (C) 2021 Sean Javiya.
//
// This file is part of the software KingOfAssembly                                                                 *
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
// *****************************************************************************
//
//
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// Author information
//   Author name: Sean Javiya
//   Author email: seanjaviya@csu.fullerton.edu
// Program information
//   Program name: KingOfAssembly
//   Programming languages: One driver module in C++, one module in X86, one
//                          bash file, and three text files (of sample input).
//   Date program began: 2021-Apr-23
//   Date of last update: 2021-Mar-20
//   Date of reorganization of comments: 2021-May-20
//   Files in this program: Main.cpp, interview.asm, chris.txt, social.txt,
//                          csmajor.txt, run.sh
//   Status: Finished.
//   The program was tested extensively with no errors in (Tuffix) Ubuntu 20.04
// Purpose
//   This program is the driver program.  This program takes a user's name from
//   the standard input device.   This program will then collect the user's
//   expected salary through the standard output device. This program will begin
//   the interview (by calling interview.asm)
//   This program will also be submit (for credit) for an assignment conducted
//   during my graduate studies program.
// This file
//    File name: Main.cpp
//    Language: C++
//    Max page width: 132 columns  (this file was not optimized for printing)
//    Compile:
//      g++ -c -Wall -m64 -no-pie -o Main.o Main.cpp
//    Link:
//      g++ -m64 -no-pie -o employ.out Main.o interview.o
//
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
#include <stdio.h>
#include <cstdlib>
#include <iostream>
extern "C" double interview(char name[], double expected_salary);
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
