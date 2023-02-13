*** Settings ***
Resource    ../resources/Config.robot

*** Keywords ***
que esteja conectado na mockAPI
    create session    mock     http://localhost:8080/financial-instrument/v1

envio metodo GET no caminho /carbon-credit
    ${HEADER}=       create dictionary       Content-Type=application/json   Authorization=${TOKEN}
    ${RESPOSTA}=     get on session    mock     /carbon-credit      headers=${HEADER}
    set global variable    ${RESPOSTA}

envio metodo GET no caminho /carbon-credit/pending-approval
    ${HEADER}=       create dictionary       Content-Type=application/json   Authorization=${TOKEN}
    ${RESPOSTA}=     get on session    mock     /carbon-credit/pending-approval      headers=${HEADER}
    set global variable    ${RESPOSTA}

enviar request sem autenticação
    ${RESPOSTA}=     get on session    mock     /carbon-credit
#Keywork anterior complementa keyword abaixo
envio metodo GET sem autenticação no caminho /carbon-credit
    ${RESPOSTA}=     run keyword and return status    enviar request sem autenticação
    set global variable    ${RESPOSTA}

envio metodo GET com ID no caminho /carbon-credit/[id]
    ${HEADER}=       create dictionary       Content-Type=application/json   Authorization=${TOKEN}
    ${RESPOSTA}=     get on session    mock     /carbon-credit/${ID}      headers=${HEADER}
    set global variable    ${RESPOSTA}

envio metodo POST no caminho /carbon-credit
    ${HEADER}=       create dictionary       Content-Type=application/json   Authorization=${TOKEN}
    ${BODY}=         create dictionary       cpfCnpj=795.606.760-08
    ${BODY_JSON}=    Json.Dumps    ${BODY}
    ${RESPOSTA}=     post on session    mock     /carbon-credit      headers=${HEADER}       data=${BODY_JSON}
    set global variable    ${RESPOSTA}

enviar metodo POST com conteudo inválido no caminho /carbon-credit/approval
    ${HEADER}=       create dictionary       Content-Type=application/json   Authorization=${TOKEN}
    ${BODY}=         create dictionary       conteudo=invalido    chave=valor
    ${BODY_JSON}=    Json.Dumps    ${BODY}
    ${RESPOSTA}=     post on session    mock     /carbon-credit/approval      headers=${HEADER}       data=${BODY_JSON}
#Keywork anterior complementa keyword abaixo
envio metodo POST com conteudo inválido no caminho /carbon-credit/approval
    ${RESPOSTA}=     run keyword and return status    enviar metodo POST com conteudo inválido no caminho /carbon-credit/approval
    set global variable    ${RESPOSTA}

enviar POST sem body no caminho /carbon-credit/holder-approval
    ${HEADER}=       create dictionary       Content-Type=application/json   Authorization=${TOKEN}
    ${RESPOSTA}=     post on session    mock     /carbon-credit/holder-approval      headers=${HEADER}
#Keywork anterior complementa keyword abaixo
envio metodo POST sem body no caminho /carbon-credit/holder-approval
    ${RESPOSTA}=     run keyword and return status    enviar POST sem body no caminho /carbon-credit/holder-approval
    set global variable    ${RESPOSTA}

enviar post com CPF inválido
    ${HEADER}=       create dictionary       Content-Type=application/json   Authorization=${TOKEN}
    ${BODY}=         create dictionary       cpfCnpj=2
    ${BODY_JSON}=    Json.Dumps    ${BODY}
    ${RESPOSTA}=     post on session    mock     /carbon-credit      headers=${HEADER}       data=${BODY_JSON}

envio metodo POST no caminho /carbon-credit com CPF inválido
    ${RESPOSTA}=     run keyword and return status     enviar post com CPF inválido
    set global variable    ${RESPOSTA}

enviar GET com ID inválido
    ${HEADER}=       create dictionary       Content-Type=application/json   Authorization=${TOKEN}
    ${RESPOSTA}=     get on session    mock     /carbon-credit/99      headers=${HEADER}
#Keywork anterior complementa keyword abaixo
envio metodo GET no caminho /carbon-credit/[id] com ID inválido
    ${RESPOSTA}=     run keyword and return status     enviar GET com ID inválido
    set global variable    ${RESPOSTA}

recebo resposta com o CPF esperado
    ${CPF}=     get from dictionary    ${RESPOSTA.json()}       cpfCnpj
    should be equal as strings      ${CPF}      841.155.040-05

recebo resposta com o ID esperado
    ${RESPOSTA}=    get from dictionary    ${RESPOSTA.json()}       id
    should be equal as integers    ${RESPOSTA}      ${ID}

recebo resposta com o holder contendo nome correto
    ${RESPOSTA}=    get from dictionary    ${RESPOSTA.json()}       holder
    dictionary should contain item      ${RESPOSTA}      name    john
    log    ${RESPOSTA}

recebo resposta com o certifier contendo valor correto
    ${CERTIFIER}=    get from dictionary    ${RESPOSTA.json()}       certifier
    should be equal as strings      ${CERTIFIER}      certifierx

recebo resposta com a data contendo valor correto
    ${DATA}=    get from dictionary    ${RESPOSTA.json()}       date
    should be equal as strings      ${DATA}      2022-08-08

recebo resposta com o description contendo valor correto
    ${DESCRIPTION}=    get from dictionary    ${RESPOSTA.json()}       description
    should be equal as strings      ${DESCRIPTION}      ativo

recebo resposta com o myNumber contendo valor correto
    ${MYNUMBER}=    get from dictionary    ${RESPOSTA.json()}       myNumber
    should be equal as strings      ${MYNUMBER}      2022

recebo status 200 OK
    should be equal as integers    ${RESPOSTA.status_code}      200
    delete all sessions

recebo status 401 Not Authorized
    status should be    401      ${RESPOSTA}
    delete all sessions

recebo status 400 Bad Request
    status should be    400      ${RESPOSTA}
    delete all sessions

recebo status 500 Server Error
    status should be    500      ${RESPOSTA}
    delete all sessions