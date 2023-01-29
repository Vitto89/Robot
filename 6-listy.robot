*** Settings ***
Library  Collections

*** Variables ***
@{My_list}  1  2  3  4
${zmienna}  4
${slowo}   WSB
*** Test Cases ***
List Basic
     FOR    ${index}    IN  @{my_list}
        Log    ${index}
     END

     append to list     ${my_list}  ${4}
     append to list     ${my_list}  wyraz
     append to list     ${my_list}  wyraz
     append to list     ${my_list}  ${slowo}
     Log    ${my_list}

     ${my_list}  remove duplicates   ${my_list}
     log    ${my_list}


     remove from list    ${my_list}    0
     remove Values From List  ${my_list} 2 3
     Log    ${my_list}

     List Should Contain Value   ${my_list}  WSB