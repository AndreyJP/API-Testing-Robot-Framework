*Settings*
Documentation   Test Suit to create characters on Marvel's API

Library     RequestsLibrary
Library     ${EXECDIR}/factories/Thanos.py

*Test Cases*
Should create a character

    Account And Set Headers     testeqaninjamarvel@hotmail.com

    &{character}    Factory Thanos

    ${response}     POST
    ...             http://marvel.qaninja.academy/characters
    ...             json=${character}
    ...             headers=${headers}

    Status Should Be    200     ${response}

*Keywords*
Account And Set Headers
    [Arguments]     ${email}

    &{user}    Create Dictionary   email=${email}

    ${response}     POST
    ...             http://marvel.qaninja.academy/accounts
    ...             json=${user}

    ${cliente_key}  Set Variable    ${response.json()}[client_key]
    &{HEADERS}      Create Dictionary   client_key=${cliente_key}

    Set Suite Variable   ${HEADERS}