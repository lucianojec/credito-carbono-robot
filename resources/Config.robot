*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     BuiltIn
Library     JSONLibrary
Library     json

*** Variables ***
${URL}              http://localhost:8080/financial-instrument/v1
${TOKEN}            Bearer yaman24
${ID}               1