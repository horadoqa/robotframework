*** Settings ***
Documentation       PDF para Texto
...                 Link do Projeto de Mineração de PDF: https://github.com/avedensky/pdfminer.six/blob/master/tools/pdf2txt.py
...                 Link para a Documentação da Library Process: https://robotframework.org/robotframework/latest/libraries/Process.html
Library             OperatingSystem
Library             Process

*** Test Cases ***
PDF para Texto
    O usuario confere os dados do PDF

*** Keywords ***
O usuario confere os dados do PDF
#Montando o caminho completo do arquivo PDF
    ${home_dir}=        normalize path  /home/rfahham/projetos/robotframework/projetos
    ${download_dir}=    Join Path   ${home_dir}     pdf
    @{items}=	        OperatingSystem.List Directory                 ${download_dir}       robot.pdf
    ${file}=            Join Path    ${download_dir}    ${items[0]}

#Extração dos Dados do PDF
    ${PDF_EXTRACT_TEXT}=          Process.Run Process        pdf2txt.py  ${file}    shell=yes  alias=myproc
    ${stdout}	${stderr}=        Get Process Result         myproc	stdout=yes	stderr=yes

#Armazenando Saída no Log
    Log To Console     ${SPACE}
    Log To Console     ${SPACE}
    Log To Console     ${stdout}
    Log To Console     ${SPACE}
    Log                ${stdout}

#Conferência dos Dados Exportados
    ${Texto}           Should Contain  ${stdout}  Robot Framework