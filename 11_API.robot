*** Settings ***
Library                                 RequestsLibrary

*** Variables ***
${token}  0b4c27d8aaf5f42b1c3d153ff30588546a6be847f31d0ff83ef2df30857fe3e0
*** Test Cases ***
GET_STATUS
    ${get_response}    GET    https://simple-books-api.glitch.me/status
    Log to console    status ${get_response}
GET_BOOKS
    ${get_response}    GET    https://simple-books-api.glitch.me/books
    Log to console    status ${get_response}
#POST_REGISTRATION
#    ${register_json}    create dictionary    clientName=Kamil2ddx   clientEmail=kamil2ddx@example.com
#    ${post_register_response}    POST    https://simple-books-api.glitch.me/api-clients/
#    ...                                                            json=${register_json}
ORDER
    ${headers}    create dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${order_body}    create dictionary   bookId=4    customerName=Kamil2
    ${post_order_response}    POST    https://simple-books-api.glitch.me/orders
        ...                                           headers=${headers}    json=${order_body}





#API_GET_TEST_1
#    ${get_response}  GET  https://simple-books-api.glitch.me/status/
#    Log to console  status ${get_response}
#    ${register_json}  create dictionary  clientName=kamilddx1   clientEmail=kamilddx1@example.com
#    ${post_register_response}  POST   https://simple-books-api.glitch.me/api-clients/
#    ...                                                                json=${register_json}

##API_GET_TEST_2
#   # ${get_response}  GET     https://simple-books-api.glitch.me/books/
#    Log to console  books ${get_response}


