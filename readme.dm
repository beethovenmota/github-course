Curso de Git

#include <iostream>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <vector>
#include <locale.h>
#include <unistd.h>
#include <windows.h>


#define TAM 1000
//const int TAM = 1000;


using namespace std;



struct Tipo_transacao{
    char descricao[150];
    int dia;
    int mes;
    int ano;
    char tipo; // C ou D
    float valor;
};

Tipo_transacao CapturaDados(){
    Tipo_transacao temp;

    char data[9];
    _strdate(data);

    //MM/DD/AAAA

    char dia[3], mes[3], ano[4];
    dia[0] = data[3];
    dia[1] = data[4];

    mes[0] = data[0];
    mes[1] = data[1];

    ano[0] = data[6];
    ano[1] = data[7];
    ano[2] = data[8];
    ano[3] = data[9];


    cout<<" Tipo:\n";
    cout<<"  D - DEBITO\n  C - CREDITO";
    cout<<"\nInforme o tipo: ";
    cin>>temp.tipo;

    cout<<"Descricao: ";
    cin>>temp.descricao;

    cout<<"Valor: ";
    cin>>temp.valor;

    temp.dia = atoi(dia);
    temp.mes = atoi(mes);
    temp.ano = atoi(ano);

    return temp;
}

bool RegistrarOperacao(Tipo_transacao op, Tipo_transacao operacoes[TAM], int ind){
    operacoes[ind].dia = op.dia;
    operacoes[ind].mes = op.mes;
    operacoes[ind].ano = op.ano;
    operacoes[ind].valor = op.valor;
    operacoes[ind].tipo = op.tipo;

    strcpy(operacoes[ind].descricao,op.descricao);
    return true;
}

void ConsultarExtrato(Tipo_transacao ops[TAM], int cont){
    cout<<"\n\t  ----  Extrato  ---- \n\n";
    cout<<"Data    Descricao    Valor    Tipo\n";
    for(int i=0;i<cont;i++){
        cout<<ops[i].dia<<"/"<<ops[i].mes<<"/"<<ops[i].ano;
        cout<<"  "<<ops[i].descricao;
        cout<<"  "<<ops[i].valor;
        cout<<"  "<<ops[i].tipo<<endl;
    }
    cout<<"\n\t  ------------------ ";
}

int main(){
    setlocale(LC_ALL, "portuguese");
    int senha,nascimento;
	int dian(2),mesn(2),anon(4);
	int contatransf,autorizacao;
	float valordepos,valortransf;
	int chavepix;
	string nome;
    char cpf[11];

    float saldoinicial(00.00);
    float ConsultarSaldo;

    float nconta[6]; //numero da conta
    char agencia[4];

    float transferencia;
    float pix;

    int opcao;
    int cont = 0;
    Tipo_transacao operacoes[TAM];
    Tipo_transacao aux;



    while(1){
        system("cls");


	       cout<<"-------------------DigiBank++-------------------\n";
    cout<<"Olá! Seja bem vindo ao DigiBank++.         \n";
    cout<<"Para começar, nos diga o seu nome:";
    cin>>nome;
    system("cls");
    cout<<"-------------------DigiBank++-------------------\n";
	cout<<"Perfeito!"<<nome<<",  nos diga a sua data de nascimento;\n ";
	cout<<"Dia:";
	std::cin >> dian;
   if ( std::cin.get() != '/' )
   cout<<"Mês:";
   std::cin >> mesn;
   if ( std::cin.get() != '/' )
   cout<<"Ano:";
   std::cin >> anon;
   if ( std::cin.get() != '/' )
   system("cls");
   cout<<"-------------------DigiBank++-------------------\n";
   cout<<"Para garantir uma maior segurança, crie uma senha\nque tenha 6 números:";
   cin>>senha;
   system("cls");
   cout<<"-------------------DigiBank++-------------------\n";
   cout<<"Pronto! Aguarde um instante para acessar sua conta ";
   sleep(3);
   system("cls");
   goto m;


	m:
   cout<<"|-------------------DigiBank++-----------------|\n";
   cout<<"|----------------------MENU--------------------|\n";
   cout<<"|(1)DEPÓSITO                                   |\n";
   cout<<"|(2)CONSULTAR EXTRATO                          |\n";
   cout<<"|(3)TRANSFERÊNCIA                              |\n";
   cout<<"|(4)MINHA CONTA                                |\n";
   cout<<"|(5)PIX                                        |\n";
   cout<<"|(6)SAIR                                       |\n";
   cout<<"|Digite a opção desejada:";
   cin>>opcao;

        switch(opcao){
        case 1:
            system("cls");
            cout<<"-------------------DigiBank++-------------------\n";
            cout<<"Insira o valor do depósito:";
            cin>>valordepos;
            (saldoinicial=saldoinicial+valordepos);
            system("cls");
            cout<<"-------------------DigiBank++-------------------\n";
            cout<<"Certinho,"<<nome<<"! Seu saldo agora é:\n";
            cout<<"R$ "<<saldoinicial<<"\n";
            system("pause");
            system("cls");
            goto m;
        case 2:
            system("cls");
              system("cls");
            aux = CapturaDados();
            if(RegistrarOperacao(aux,operacoes, cont)){
                cout<<"\nOperacao registrada\n";
                cont++;
            }else{
                cout<<"\nErro ao registrar a operacao! Tente novamente!\n";
            }
            system("pause");
            system("cls");
            goto m;
        case 3:
            system("cls");
            if(saldoinicial==0){
            	cout<<"-------------------DigiBank++-------------------\n";
                cout<<"Você não possui saldo suficiente!\n";
            }else{
            	cout<<"-------------------DigiBank++-------------------\n";
                cout<<"Insira o valor desejado:";
                cin>>valortransf;
                if(valortransf>saldoinicial){
                	system("cls");
                	cout<<"-------------------DigiBank++-------------------\n";
                	cout<<"Você não possui saldo suficiente!\n";
				}else{
					system("cls");
					cout<<"-------------------DigiBank++-------------------\n";
					cout<<"Insira o número da conta:";
					cin>>contatransf;
					s1:
					cout<<"Confirme sua senha;";
				    cin>>autorizacao;
				    if(autorizacao==senha){
				    	system("cls");
				    	cout<<"-------------------DigiBank++-------------------\n";
				    	cout<<"Transferência concluída com sucesso!\nAperte qualquer tecla para voltar ao menu.\n";
				    	(saldoinicial=saldoinicial-valortransf);
				    }else{
				    	system("cls");
				    	cout<<"-------------------DigiBank++-------------------\n";
				    	cout<<"Senha inválida. Tente novamente :/\n";
				    	goto s1;
					}
				}
            }
            system("pause");
            system("cls");
            goto m;
        case 4:
            system("cls");
            cout<<"-------------------DigiBank++-------------------\n";
            cout<<"Seu saldo:"<<saldoinicial<<"\n";
            cout<<"Nome:"<<nome<<"\n";
            cout<<"Data de nascimento:"<<dian<<"/"<<mesn<<"/"<<anon<<"\n";
            system("pause");
            system("cls");
            goto m;
        case 5:
            system("cls");
            if(saldoinicial==0){
            	cout<<"-------------------DigiBank++-------------------\n";
                cout<<"Você não possui saldo suficiente!\n";
            }else{
            	p:
            	system("cls");
            	cout<<"-------------------DigiBank++-------------------\n";
                cout<<"Insira o valor desejado:";
                cin>>valortransf;
                if(valortransf>saldoinicial){
                	system("cls");
                	cout<<"-------------------DigiBank++-------------------\n";
                	cout<<"Você não possui saldo suficiente!\n";
                	goto p;
				}else{
					system("cls");
					cout<<"-------------------DigiBank++-------------------\n";
					cout<<"Insira a chave: ";
					cin>>chavepix;
					s2:
					cout<<"Confirme sua senha;";
				    cin>>autorizacao;

				    if(autorizacao==senha){
				    	system("cls");
				    	cout<<"-------------------DigiBank++-------------------\n";
				    	cout<<"Transferência concluída com sucesso!\nComprovante:\nChave:"<<chavepix<<"\nValor transferido:"<<valortransf<<"\n";
				    	(saldoinicial=saldoinicial-valortransf);
				    }else{
				    	system("cls");
				    	cout<<"-------------------DigiBank++-------------------\n";
				    	cout<<"Senha inválida. Tente novamente :/\n";
				    	goto s2;
					}
				}
            }
            system("pause");
            system("cls");
            goto m;

        case 6:
        	cout<<"-------------------DigiBank++-------------------\n";
            cout<<"\n\nFinalizando...\n\n";
            system("pause");
            exit(0);
            break;
        default:
        	cout<<"-------------------DigiBank++-------------------\n";
            cout<<"\nOpcao invalida! Tente novamente!\n";
        }
    }
    return 0;
}
