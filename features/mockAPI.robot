*** Settings ***
Resource    ../resources/Config.robot
Resource    ../steps/mockAPI.robot
Resource    ../resources/BDDpt-br.robot

*** Test Cases ***
CT-001: Validar código de erro ao enviar um request sem autenticação
    [Tags]    ct-001
    Dado que esteja conectado na mockAPI
    Quando envio metodo GET sem autenticação no caminho /carbon-credit
    Entao recebo status 401 Not Authorized

CT-002: Validar código de sucesso ao usar método GET no caminho /carbon-credit
    [Tags]    ct-002
    Dado que esteja conectado na mockAPI
    Quando envio metodo GET no caminho /carbon-credit
    Entao recebo status 200 OK

CT-003: Validar código de sucesso ao usar método GET no caminho /carbon-credit/pending-approval
    [Tags]    ct-003
    Dado que esteja conectado na mockAPI
    Quando envio metodo GET no caminho /carbon-credit/pending-approval
    Entao recebo status 200 OK

CT-004: Validar código de sucesso ao usar método POST no caminho /carbon-credit
    [Tags]    ct-004
    Dado que esteja conectado na mockAPI
    Quando envio metodo POST no caminho /carbon-credit
    Entao recebo status 200 OK

CT-005: Validar código de erro ao usar método POST com conteudo inválido no caminho /carbon-credit/approval
    [Tags]    ct-005
    Dado que esteja conectado na mockAPI
    Quando envio metodo POST com conteudo inválido no caminho /carbon-credit/approval
    Entao recebo status 400 Bad Request

CT-006: Validar código de erro ao usar método POST sem body no caminho /carbon-credit/holder-approval
    [Tags]    ct-006
    Dado que esteja conectado na mockAPI
    Quando envio metodo POST sem body no caminho /carbon-credit/holder-approval
    Entao recebo status 400 Bad Request

CT-007: Validar código de falha ao usar método POST no caminho /carbon-credit com CPF inválido
    [Tags]    ct-007
    Dado que esteja conectado na mockAPI
    Quando envio metodo POST no caminho /carbon-credit com CPF inválido
    Entao recebo status 400 Bad Request

CT-008: Validar falha ao usar ID inválido no caminho /carbon-credit/[id]
    [Tags]    ct-008
    Dado que esteja conectado na mockAPI
    Quando envio metodo GET no caminho /carbon-credit/[id] com ID inválido
    Entao recebo status 500 Server Error

CT-009: Validar retorno do ID correto ao usar GET com ID no caminho /carbon-credit/[id]
    [Tags]    ct-009
    Dado que esteja conectado na mockAPI
    Quando envio metodo GET com ID no caminho /carbon-credit/[id]
    Entao recebo resposta com o ID esperado

CT-010: Validar retorno de CPF correto ao usar GET com ID no caminho /carbon-credit/[id]
    [Tags]    ct-010
    Dado que esteja conectado na mockAPI
    Quando envio metodo GET com ID no caminho /carbon-credit/[id]
    Entao recebo resposta com o CPF esperado

CT-011: Validar campo holder contendo nome correto ao usar GET com ID no caminho /carbon-credit/[id]
    [Tags]    ct-011
    Dado que esteja conectado na mockAPI
    Quando envio metodo GET com ID no caminho /carbon-credit/[id]
    Entao recebo resposta com o holder contendo nome correto

CT-012: Validar campo certifier contendo valor correto ao usar GET com ID no caminho /carbon-credit/[id]
    [Tags]    ct-012
    Dado que esteja conectado na mockAPI
    Quando envio metodo GET com ID no caminho /carbon-credit/[id]
    Entao recebo resposta com o certifier contendo valor correto

CT-013: Validar campo date contendo valor correto ao usar GET com ID no caminho /carbon-credit/[id]
    [Tags]    ct-013
    Dado que esteja conectado na mockAPI
    Quando envio metodo GET com ID no caminho /carbon-credit/[id]
    Entao recebo resposta com a data contendo valor correto

CT-014: Validar campo description contendo valor correto ao usar GET com ID no caminho /carbon-credit/[id]
    [Tags]    ct-014
    Dado que esteja conectado na mockAPI
    Quando envio metodo GET com ID no caminho /carbon-credit/[id]
    Entao recebo resposta com o description contendo valor correto

CT-015: Validar campo myNumber contendo valor correto ao usar GET com ID no caminho /carbon-credit/[id]
    [Tags]    ct-015
    Dado que esteja conectado na mockAPI
    Quando envio metodo GET com ID no caminho /carbon-credit/[id]
    Entao recebo resposta com o myNumber contendo valor correto