*** Settings ***
Library                                 RequestsLibrary

*** Test Cases ***
API_GET_TEST_1
    ${get_response}  GET  https://simple-books-api.glitch.me/status/
    Log to console  status ${get_response}
    ${register_json}  create dictionary  clientName=kamilddx   clientEmail=kamilddx@example.com
    ${post_register_response}  POST   https://simple-books-api.glitch.me/api-clients/
    ...                                                                json=${register_json}

##API_GET_TEST_2
#   # ${get_response}  GET     https://simple-books-api.glitch.me/books/
#    Log to console  books ${get_response}


