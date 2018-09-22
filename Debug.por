programa
{
	inclua biblioteca Graficos
	inclua biblioteca Teclado
	inclua biblioteca Util
	inclua biblioteca Sons
	inclua biblioteca Mouse
	inclua biblioteca Arquivos
	inclua biblioteca Texto

	cadeia nome_personagem = " "
	inteiro estado_menu = 0
	logico fechar_jogo = falso
	logico iniciar_jogo = falso
	logico sair_menu = falso
	const inteiro largura_tela = 1024
	const inteiro altura_tela = 640
	inteiro imagem = Graficos.carregar_imagem("imagens/icone.png")
	inteiro linha_atual_personagem = 8
	inteiro coluna_atual_personagem = 4
	const inteiro sqm = 64
	const inteiro piso_x = 0
	const inteiro piso_o = 1
	const inteiro piso_t = 2
	inteiro contador_cor[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	logico reseta_cor = falso
	logico reseta_cor_2 = falso
	inteiro frisk1 = Graficos.carregar_imagem("imagens/sprites/frisk_final.png")
	inteiro frisk2 = Graficos.carregar_imagem("imagens/sprites/2.png")
	inteiro X = Graficos.carregar_imagem("imagens/sprites/X.png")
	inteiro triangulo = Graficos.carregar_imagem("imagens/sprites/verde.png")
	inteiro O = Graficos.carregar_imagem("imagens/sprites/O.png")
	inteiro circulo_verde = Graficos.carregar_imagem("imagens/sprites/circulo_verde.png")
	inteiro sem_bloqueio = Graficos.carregar_imagem("imagens/sprites/sem_bloqueio.png")
	inteiro com_bloqueio = Graficos.carregar_imagem("imagens/sprites/com_bloqueio.png")
	inteiro pedra = Graficos.carregar_imagem("imagens/sprites/pedra.png")
	inteiro reset = Graficos.carregar_imagem("imagens/sprites/reset.png")
	inteiro mapa0 = Graficos.carregar_imagem("imagens/sprites/mapa_0.png")
	inteiro mapa1 = Graficos.carregar_imagem("imagens/sprites/mapa_1.png")
	inteiro mapa2 = Graficos.carregar_imagem("imagens/sprites/mapa_2.png")
	inteiro mapa3 = Graficos.carregar_imagem("imagens/sprites/mapa_3.png")
	inteiro tecla_pressionada = -1
	//inteiro danca = Graficos.carregar_imagem("imagens/sprites/teste.gif")
	inteiro arquivos_existentes = 0
	inteiro sans_npc = Graficos.carregar_imagem("imagens/sprites/sans_2.png")
	inteiro direcao_olhar = 0			//	0=baixo 1=direita 2=cima 3=esquerda
	logico mudar_mapa = falso
	inteiro lado_do_mapa_aparecer = 0


	
	



	inteiro frisk_andando_direita = Graficos.carregar_imagem("imagens/sprites/direita_teste.png")
	inteiro frisk_andando_esquerda = Graficos.carregar_imagem("imagens/sprites/esquerda_teste.png")
	inteiro frisk_andando_acima = Graficos.carregar_imagem("imagens/sprites/cima_teste.png")
	
	
	
	inteiro frisk_atual = frisk1
	logico animacao_andando = falso

	//animação depois que zerar o jogo
	inteiro error = Graficos.carregar_imagem("imagens/gifs/error.gif")
	inteiro sans = Graficos.carregar_imagem("imagens/gifs/sans_2.gif")
	inteiro sans1 = Graficos.carregar_imagem("imagens/gifs/sans_1.gif")
	inteiro doggo = Graficos.carregar_imagem("imagens/gifs/doggo.gif")

	//inteiro som_credito_teste = Sons.carregar_som("sons/creditos_teste.mp3")
	inteiro som_inicio = Sons.carregar_som("sons/Inicio.mp3")
	inteiro som_menu_nome = Sons.carregar_som("sons/menu.mp3")


	inteiro obstaculos_mapa_0[10][16]
	inteiro obstaculos_mapa_1[10][16]
	inteiro obstaculos_mapa_2[10][16]
	inteiro obstaculos_mapa_3[10][16]
	inteiro puzzles[10][16]
	inteiro puzzles_mapa_3[10][16]
	inteiro all_puzzles = Arquivos.abrir_arquivo("puzzles/1_mapa.txt", Arquivos.MODO_LEITURA)
	inteiro puzzles_2 = Arquivos.abrir_arquivo("puzzles/2_mapa.txt", Arquivos.MODO_LEITURA)
	inteiro obstaculos_puzzle_1 = Arquivos.abrir_arquivo("obstaculos/1_mapa.txt", Arquivos.MODO_LEITURA)
	inteiro obstaculos_mapa_inicial = Arquivos.abrir_arquivo("obstaculos/0_mapa.txt", Arquivos.MODO_LEITURA)
	inteiro obstaculos_mapa_02 = Arquivos.abrir_arquivo("obstaculos/2_mapa.txt", Arquivos.MODO_LEITURA)
	inteiro obstaculos_mapa_03 = Arquivos.abrir_arquivo("obstaculos/3_mapa.txt", Arquivos.MODO_LEITURA)

	
	//characters
	inteiro you = Arquivos.abrir_arquivo("sretcarahc/YoU/YoU.txt", Arquivos.MODO_ESCRITA)
	logico arquivo_caue_existe = Arquivos.arquivo_existe("sretcarahc/cauê.txt")
	logico arquivo_cristian_existe = Arquivos.arquivo_existe("sretcarahc/cristian.txt")

	logico abajur_fala = falso
	logico fala_sans_tutorial = falso
	logico placa_tutorial = falso
	inteiro fala_caixa_de_texto_tutorial = Graficos.carregar_imagem("imagens/sprites/fala_sans.png")
	logico aguardar_fala_personagem = falso

	logico saidas_mapa_1 = falso //falso = com bloqueio
	logico saidas_mapa_3 = falso
	
	inteiro puzzle_completo_somar = 0
	inteiro puzzle_completo_somar_2 = 0


				//efeitos sonoros
	inteiro musica_mapa_gelo = Sons.carregar_som("sons/snowdin_sound.mp3")
	inteiro musica_ruinas = Sons.carregar_som("sons/ruins_sound.mp3")
	inteiro abrindo_saidas = Sons.carregar_som("sons/effects/abrindo_saidas.wav")
	logico tocando_musica_snowdin = falso
	logico tocando_musica_ruins = falso
	inteiro abrindo_saidas_som = 0
	inteiro abrindo_saidas_som_2 = 0
	

				//lista de mapas abaixo
	logico mapa_inicial = verdadeiro 
	logico mapa_2 = falso   
	logico mapa_puzzle_1 = falso // mapa de puzzle 1
	logico mapa_3 =  falso
	logico voltando_mapa_3 = falso
	
	

	logico testando_texto = falso


	//animacoes mapa 2
	logico animacao_inicio_mapa_2 = verdadeiro
	inteiro abajur = Graficos.carregar_imagem("imagens/sprites/abajur.png")
	inteiro andando_2_frisk = Graficos.carregar_imagem("imagens/sprites/andando_direita2.png")



	//inteiro frisk_direita_1_gameplay = Graficos.carregar_imagem("imagens/sprites/movimento/direita_1.png")
	inteiro frisk_direita_2_gameplay = Graficos.carregar_imagem("imagens/sprites/movimento/direita_2.png")
	//inteiro frisk_abaixo_1_gameplay = Graficos.carregar_imagem("imagens/sprites/movimento/abaixo_1.png")
	inteiro frisk_abaixo_2_gameplay = Graficos.carregar_imagem("imagens/sprites/movimento/abaixo_2.png")
	//inteiro frisk_acima_1_gameplay = Graficos.carregar_imagem("imagens/sprites/movimento/acima_1.png")
	inteiro frisk_acima_2_gameplay = Graficos.carregar_imagem("imagens/sprites/movimento/cima_2.png")
	//inteiro frisk_esquerda_1_gameplay = Graficos.carregar_imagem("imagens/sprites/movimento/esquerda_1.png")
	inteiro frisk_esquerda_2_gameplay = Graficos.carregar_imagem("imagens/sprites/movimento/esquerda_2.png")
	logico movimento_frisk = falso
	inteiro movimento_direcao = -1

	logico reset_pressionado = falso
	inteiro reset_pressionado_imagem = Graficos.carregar_imagem("imagens/sprites/reset_pressionado.png")
	inteiro som_reset = 0
	inteiro resetando = Sons.carregar_som("sons/resetando.wav")
	
	funcao inicio()
	{

		se(nao(arquivo_caue_existe e arquivo_cristian_existe)){
			arquivos_existentes = 1
		}


		
		Graficos.carregar_fonte("fontes/MonsterFriendFore.otf")
		Graficos.carregar_fonte("fontes/DTM-Mono.otf")
		Mouse.ocultar_cursor()
		
		inicializa(largura_tela, altura_tela, imagem, som_inicio)

		enquanto(nao(sair_menu) e nao (fechar_jogo)){
			
			estado_menu = menu()
			se(estado_menu == 1){
					Sons.interromper_som(som_inicio)
					inteiro voltar_menu = escolher_nome()
					se(voltar_menu == 1){
						
						sair_menu = verdadeiro
					}
					se(voltar_menu ==0){
						Sons.reproduzir_som(som_inicio, verdadeiro)
					}
				}

			se(estado_menu == 2){
					Sons.interromper_som(som_inicio)
					creditos_menu()
					Sons.reproduzir_som(som_inicio, verdadeiro)
			}
		
			se(estado_menu == 0){
					fechar_jogo = verdadeiro
			}
		}
		Sons.liberar_som(som_inicio)
		iniciar_jogo = sair_menu

		inicializar_obstaculos_mapa_0()
		inicializar_obstaculos_mapa_1()
		inicializar_obstaculos_mapa_2()
		inicializar_obstaculos_mapa_3()
		
		inicializar_puzzles()
		inicializar_puzzles_2()
		
		enquanto(nao fechar_jogo){
			atualizar()
			desenhar()
			Util.aguarde(100)
		}
	}
	
	funcao inicializa(inteiro altura_da_tela, inteiro largura_da_tela, inteiro imagem_game, inteiro som_inicio2 )
	{
		Graficos.iniciar_modo_grafico(verdadeiro)
		Graficos.definir_dimensoes_janela(altura_da_tela, largura_da_tela)


		Graficos.definir_titulo_janela("OVERTALE")

		Graficos.definir_icone_janela(imagem)
		
		Sons.definir_volume(70)
		Sons.reproduzir_som(som_inicio2, verdadeiro)

		Graficos.definir_cor(Graficos.COR_BRANCO)
		Graficos.definir_tamanho_texto(90.0)

		inteiro logo = Graficos.redimensionar_imagem(imagem, 125, 100, verdadeiro)
		animacao(logo)
		Graficos.definir_opacidade(255)
		
		
		
		
		
		
		
	}

	funcao animacao (inteiro logo)
	{
		//Definir fonte 
		Graficos.definir_fonte_texto("Monster Friend Fore")

		//inicio
		para(inteiro i = 0; i<255; i++){
			Graficos.definir_opacidade(i)
			Graficos.desenhar_imagem(450, 300, logo)
			se(arquivos_existentes==1){
				Graficos.definir_cor(Graficos.COR_VERMELHO)
				Graficos.desenhar_texto(120, 200, "erroRTALE ")
				Graficos.definir_cor(Graficos.COR_BRANCO)
				Graficos.definir_opacidade(255)
				Graficos.desenhar_imagem(300, 450, sans)
				Graficos.desenhar_imagem(200, 450, error)
				Graficos.definir_opacidade(i)
			}
			se(arquivos_existentes==0){
				Graficos.definir_cor(Graficos.COR_BRANCO)
				Graficos.desenhar_texto(175, 200, "OVERTALE ")
				Graficos.desenhar_imagem(380, 420, doggo)
			}
			
			Graficos.renderizar()
			i= i+9
			Util.aguarde(50)		
		}

		Util.aguarde(1000)

		para(inteiro o = 255; o>5; o--){
			Graficos.definir_opacidade(o-5)	
			Graficos.desenhar_imagem(450, 300, logo)
			se(arquivos_existentes==1){
				Graficos.definir_cor(Graficos.COR_VERMELHO)
				Graficos.desenhar_texto(120, 200, "erroRTALE ")
				Graficos.definir_cor(Graficos.COR_BRANCO)
				Graficos.definir_opacidade(255)
				Graficos.desenhar_imagem(300, 450, sans)
				Graficos.desenhar_imagem(200, 450, error)
				Graficos.definir_opacidade(o-5)
			}
			se(arquivos_existentes==0){
				Graficos.definir_cor(Graficos.COR_BRANCO)
				Graficos.desenhar_texto(175, 200, "OVERTALE ")
				Graficos.desenhar_imagem(380, 420, doggo)
			}
			Graficos.renderizar()
			o= o-9
			Util.aguarde(50)
		}
	}

	funcao inteiro menu()
	{
		inteiro menuimagem = Graficos.carregar_imagem("imagens/menu/menu.png")
		inteiro novo_jogo = Graficos.carregar_imagem("Imagens/menu/novo_jogo.png")
		inteiro creditos = Graficos.carregar_imagem("Imagens/menu/creditos.png")

		inteiro movimento = 0
		logico sair = falso
				
		enquanto(fechar_jogo != verdadeiro){

			se(Teclado.tecla_pressionada(Teclado.TECLA_ESC)){
				fechar_jogo = verdadeiro
				retorne 0
			}

			se(Teclado.tecla_pressionada(Teclado.TECLA_SETA_ABAIXO) e movimento != 1 ){
				movimento = movimento+1
			}

			se(Teclado.tecla_pressionada(Teclado.TECLA_SETA_ACIMA) e movimento != 0){
				movimento = movimento-1
			}

			se(movimento==0){
			
				Graficos.desenhar_imagem(0, 0, menuimagem)
				Graficos.definir_cor(Graficos.COR_VERMELHO)
				Graficos.desenhar_imagem(300, 350, novo_jogo)
				Graficos.desenhar_imagem(300, 425, creditos)
				Graficos.definir_opacidade(50)
				Graficos.desenhar_retangulo(350, 348, 300, 55, verdadeiro, verdadeiro)
				Graficos.definir_opacidade(255)
				Graficos.renderizar()

				se(Teclado.tecla_pressionada(Teclado.TECLA_ENTER)){
					Graficos.liberar_imagem(menuimagem)
					Graficos.liberar_imagem(novo_jogo)
					Graficos.liberar_imagem(creditos)
					estado_menu = 1
					retorne 1
				}
				
			}

			se(movimento==1){
			
				Graficos.desenhar_imagem(0, 0, menuimagem)
				Graficos.definir_cor(Graficos.COR_VERMELHO)
				Graficos.desenhar_imagem(300, 350, novo_jogo)
				Graficos.desenhar_imagem(300, 425, creditos)
				Graficos.definir_opacidade(50)
				Graficos.desenhar_retangulo(350, 420, 300, 55, verdadeiro, verdadeiro)
				Graficos.definir_opacidade(255)
				Graficos.renderizar()

				se(Teclado.tecla_pressionada(Teclado.TECLA_ENTER)){
					Graficos.liberar_imagem(menuimagem)
					Graficos.liberar_imagem(novo_jogo)
					Graficos.liberar_imagem(creditos)
					estado_menu = 1
					retorne 2
				}
			}

			

			Util.aguarde(1000/60)
			
		}
		retorne 0
	}

	funcao inteiro escolher_nome()
	
	{
		Util.aguarde(150)
		
		inteiro x = 0
		inteiro y = 0
		inteiro letras_imagem = Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/A.png")
		inteiro pressione_sair = Graficos.carregar_imagem("imagens/menu/pressiona_sair.png")
		Sons.reproduzir_som(som_menu_nome, verdadeiro)

		cadeia nome_final
		
		cadeia letras[8][7] =  { {"A", "B", "C", "D", "E", "F", "G"},
							{"H", "I", "J", "K", "L", "M", "N"},
							{"O", "P", "Q", "R", "S", "T", "U"}, 
							{"V", "W", "X", "Y", "Z", " ", " "},
							{"a", "b", "c", "d", "e", "f", "g"}, 
							{"h", "i", "j", "k", "l", "m", "n"},
							{"o", "p", "q", "r", "s", "t", "u"},
							{"v", "w", "x", "y", "z", " ", " "}}


		inteiro tecla = -1
		
		enquanto(tecla != Teclado.TECLA_ENTER ou tecla != Teclado.TECLA_ESC){
			
			Graficos.definir_cor(Graficos.COR_BRANCO)
			Graficos.definir_fonte_texto("Determination Mono")
			Graficos.definir_tamanho_texto(36.0)
			Graficos.desenhar_texto(350, 50, "Nome da criança:")
			Graficos.definir_cor(Graficos.COR_AMARELO)
			Graficos.desenhar_texto(450, 100, nome_personagem)
			Graficos.definir_cor(Graficos.COR_BRANCO)
			Graficos.desenhar_imagem(200, 150, letras_imagem)
			Graficos.desenhar_imagem(200, 520, pressione_sair)
			Graficos.renderizar()
			

			se(tecla == Teclado.TECLA_ENTER){
				Sons.interromper_som(som_menu_nome)
				Arquivos.escrever_linha(nome_personagem, you)
				Arquivos.fechar_arquivo(you)
				retorne 1
				
			}

			se(tecla == Teclado.TECLA_ESC){
				nome_personagem = ""
				Sons.interromper_som(som_menu_nome)
				retorne 0
			}


			
			tecla = Teclado.ler_tecla()



			cadeia temporario

			logico pular2 = (y == 2 e x== 5) ou (y == 2 e x == 6)
			logico pular2_acima = ((y == 4 e x == 5) ou (y == 4 e x == 6))
			logico nao_pular = (y == 6 e x == 5) ou (y == 6 e x == 6)
			logico nao_pular_direita = (y == 3 e x == 4) ou (y == 7 e x == 4)

			se(tecla == (Teclado.TECLA_Z)){
				temporario = letras[y][x]
				nome_personagem = nome_personagem+temporario
				Util.aguarde(100)
			}

			
			se(tecla == (Teclado.TECLA_X)){
				nome_personagem = ""
				Util.aguarde(100) 
			}
			
			
			se(tecla == (Teclado.TECLA_SETA_DIREITA) e (x<6)){
				se(nao_pular_direita){
					x=x
				}
				senao{
					x = x+1
				}

			}

			se(tecla == (Teclado.TECLA_SETA_ESQUERDA) e (x!=0)){
				x = x-1
			}

			
			se(tecla == (Teclado.TECLA_SETA_ABAIXO) e (y<7)){
				se(nao(pular2) e nao(nao_pular)){
					y = y+1
				}

				se(pular2){
					y=y+2
				}

				se(nao_pular){
					y=y
				}
			}

			se(tecla == (Teclado.TECLA_SETA_ACIMA) e (y != 0)){
			
				se(pular2_acima){
					y = y-2
				}
				senao{
					y = y-1
				}
				
			}


			se(x==0 e y==0){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/A.png")
			}

			se(x==1 e y==0){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/B.png")
			}

			se(x==2 e y==0){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/C.png")
			}

			se(x==3 e y==0){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/D.png")
			}

			se(x==4 e y==0){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/E.png")
			}

			se(x==5 e y==0){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/F.png")
			}

			se(x==6 e y==0){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/G.png")
			}
			
			se(x==0 e y==1){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/H.png")
			}

			se(x==1 e y==1){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/I.png")
			}
			
			se(x==2 e y==1){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/J.png")
			}

			se(x==3 e y==1){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/K.png")
			}

			se(x==4 e y==1){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/L.png")
			}

			se(x==5 e y==1){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/M.png")
			}

			se(x==6 e y==1){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/N.png")
			}

			se(x==0 e y==2){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/O.png")
			}

			se(x==1 e y==2){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/P.png")
			}
			
			se(x==2 e y==2){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/Q.png")
			}

			se(x==3 e y==2){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/R.png")
			}

			se(x==4 e y==2){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/S.png")
			}

			se(x==5 e y==2){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/T.png")
			}

			se(x==6 e y==2){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/U.png")
			}

			se(x==0 e y==3){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/V.png")
			}

			se(x==1 e y==3){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/W.png")
			}
			
			se(x==2 e y==3){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/X.png")
			}

			se(x==3 e y==3){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/Y.png")
			}

			se(x==4 e y==3){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/Z.png")
			}

			se(x==0 e y==4){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/a_m.png")
			}

			se(x==1 e y==4){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/b_m.png")
			}
			
			se(x==2 e y==4){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/c_m.png")
			}

			se(x==3 e y==4){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/d_m.png")
			}

			se(x==4 e y==4){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/e_m.png")
			}

			se(x==5 e y==4){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/f_m.png")
			}

			se(x==6 e y==4){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/g_m.png")
			}

			se(x==0 e y==5){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/h_m.png")
			}

			se(x==1 e y==5){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/i_m.png")
			}
			
			se(x==2 e y==5){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/j_m.png")
			}

			se(x==3 e y==5){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/k_m.png")
			}

			se(x==4 e y==5){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/l_m.png")
			}

			se(x==5 e y==5){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/m_m.png")
			}

			se(x==6 e y==5){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/n_m.png")
			}

			se(x==0 e y==6){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/o_m.png")
			}

			se(x==1 e y==6){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/p_m.png")
			}
			
			se(x==2 e y==6){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/q_m.png")
			}

			se(x==3 e y==6){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/r_m.png")
			}

			se(x==4 e y==6){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/s_m.png")
			}

			se(x==5 e y==6){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/t_m.png")
			}

			se(x==6 e y==6){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/u_m.png")
			}

			se(x==0 e y==7){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/v_m.png")
			}

			se(x==1 e y==7){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/w_m.png")
			}

			se(x==2 e y==7){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/x_m.png")
			}

			se(x==3 e y==7){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/y_m.png")
			}

			se(x==4 e y==7){
				Graficos.liberar_imagem(letras_imagem)
				Graficos.carregar_imagem("imagens/menu/selecao_nome_cor/z_m.png")
			}
			
		}
		retorne 0

	}
	
	funcao creditos_menu () 
	{
		inteiro som_creditos = Sons.carregar_som("sons/creditos_final2.mp3")
		Sons.definir_volume(80)
		//Sons.reproduzir_som(som_credito_teste, verdadeiro)
		Sons.reproduzir_som(som_creditos, verdadeiro)
		inteiro creditos = Graficos.carregar_imagem("imagens/menu/creditos_fim.png")
		para(inteiro i=0;i<2560;i++){
			Graficos.desenhar_porcao_imagem(0, 0, 0, i, 1024, 640, creditos)
			Graficos.renderizar()
			Util.aguarde(30)
		}
		Util.aguarde(5000)
		Sons.interromper_som(som_creditos)
		Sons.liberar_som(som_creditos)
		Sons.definir_volume(70)
		//Sons.interromper_som(som_credito_teste)
	}
	
	funcao inicializar_obstaculos_mapa_0()
	{

		para (inteiro i = 0; i < 10; i += 1) {
			inteiro posicao_inicial = 0
			cadeia linha = Arquivos.ler_linha(obstaculos_mapa_inicial)
			para (inteiro j = 0; j < 16; j+= 1) {

					posicao_inicial = j * 3													
					cadeia obstaculo_mapa_inicial = Texto.extrair_subtexto(linha, posicao_inicial, posicao_inicial + 2)
					
					
					se (obstaculo_mapa_inicial == " 1") {
						obstaculos_mapa_0[i][j] = -1
					}
					senao {
						obstaculos_mapa_0[i][j] = 0
					}
			}
		}
	}
		
	funcao inicializar_obstaculos_mapa_1()
	{
		para (inteiro i = 0; i < 10; i += 1) {
			inteiro posicao_inicial = 0
			cadeia linha = Arquivos.ler_linha(obstaculos_puzzle_1)
			para (inteiro j = 0; j < 16; j+= 1) {

				posicao_inicial = j * 3													
				cadeia obstaculo_puzzle_1 = Texto.extrair_subtexto(linha, posicao_inicial, posicao_inicial + 2)
					
					
				se (obstaculo_puzzle_1 == " 1") {
					obstaculos_mapa_1[i][j] = -1
				}
				senao {
					obstaculos_mapa_1[i][j] = 0
				}
			}
		}
	}

	funcao inicializar_obstaculos_mapa_2()
	{

		para (inteiro i = 0; i < 10; i += 1) {
			inteiro posicao_inicial = 0
			cadeia linha = Arquivos.ler_linha(obstaculos_mapa_02)
			para (inteiro j = 0; j < 16; j+= 1) {

					posicao_inicial = j * 3													
					cadeia obstaculo_mapa_2 = Texto.extrair_subtexto(linha, posicao_inicial, posicao_inicial + 2)
					
					
					se (obstaculo_mapa_2 == " 1") {
						obstaculos_mapa_2[i][j] = -1
					}
					senao {
						obstaculos_mapa_2[i][j] = 0
					}
			}
		}
	}

	funcao inicializar_obstaculos_mapa_3()
	{

		para (inteiro i = 0; i < 10; i += 1) {
			inteiro posicao_inicial = 0
			cadeia linha = Arquivos.ler_linha(obstaculos_mapa_03)
			para (inteiro j = 0; j < 16; j+= 1) {

					posicao_inicial = j * 3													
					cadeia obstaculo_mapa_3 = Texto.extrair_subtexto(linha, posicao_inicial, posicao_inicial + 2)
					
					
					se (obstaculo_mapa_3 == " 1") {
						obstaculos_mapa_3[i][j] = -1
					}
					senao {
						obstaculos_mapa_3[i][j] = 0
					}
			}
		}
	}

	funcao inicializar_puzzles()
	{
	
	para (inteiro i = 0; i < 10; i += 1) {
		inteiro posicao_inicial = 0
		cadeia linha = Arquivos.ler_linha(all_puzzles)
		para (inteiro j = 0; j < 16; j+= 1) {

					posicao_inicial = j * 3
					cadeia puzzle = Texto.extrair_subtexto(linha, posicao_inicial, (posicao_inicial + 2))
					
					
					
					se (puzzle == " 1") {
						puzzles[i][j] = -1
					}
					senao {
						puzzles[i][j] = 0
					}
		}
	}
	
	}

	funcao inicializar_puzzles_2()
	{
	
	para (inteiro i = 0; i < 10; i += 1) {
		inteiro posicao_inicial = 0
		cadeia linha = Arquivos.ler_linha(puzzles_2)
		para (inteiro j = 0; j < 16; j+= 1) {

					posicao_inicial = j * 3
					cadeia puzzle = Texto.extrair_subtexto(linha, posicao_inicial, (posicao_inicial + 2))
					
					
					
					se (puzzle == " 1") {
						puzzles_mapa_3[i][j] = -1
					}
					senao {
						puzzles_mapa_3[i][j] = 0
					}
		}
	}
	
	}

	funcao atualizar() 
	{	
		se (Teclado.tecla_pressionada(Teclado.TECLA_ESC)){
			fechar_jogo = verdadeiro
		}
		inteiro quantidade_colunas = largura_tela / sqm
		inteiro quantidade_linhas = altura_tela / sqm

		direcao_olhar_personagem()

		

		se(mapa_inicial){

			

			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_DIREITA) e coluna_atual_personagem < quantidade_colunas - 1 e nao tem_obstaculo(linha_atual_personagem, coluna_atual_personagem + 1) e nao movimento_frisk ){
				coluna_atual_personagem += 1	
				//frisk_atual = frisk_andando_direita
				movimento_frisk = verdadeiro
				movimento_direcao = 1
			
			}
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_ESQUERDA) e coluna_atual_personagem > 0 e nao tem_obstaculo(linha_atual_personagem, coluna_atual_personagem - 1) e nao movimento_frisk) {
				coluna_atual_personagem -= 1
				//frisk_atual = frisk_andando_esquerda
				movimento_frisk = verdadeiro
				movimento_direcao = 3
			}
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_ABAIXO) e linha_atual_personagem < quantidade_linhas - 1 e nao tem_obstaculo(linha_atual_personagem+1, coluna_atual_personagem) e nao movimento_frisk) {
				linha_atual_personagem += 1
				//frisk_atual = frisk1
				movimento_frisk = verdadeiro
				movimento_direcao = 0
			}
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_ACIMA) e linha_atual_personagem > 0 e nao tem_obstaculo(linha_atual_personagem - 1, coluna_atual_personagem) e nao movimento_frisk) {
				linha_atual_personagem -= 1
				//frisk_atual = frisk_andando_acima
				movimento_frisk = verdadeiro
				movimento_direcao = 2
			}

			se((linha_atual_personagem == 6 e coluna_atual_personagem == 15) ou (linha_atual_personagem == 8 e coluna_atual_personagem == 15) ou (linha_atual_personagem == 7 e coluna_atual_personagem == 15)){
				mudar_mapa = verdadeiro
				mapa_inicial = falso
				mapa_2 = verdadeiro
				lado_do_mapa_aparecer = 1
			}
			
		}

		se(mapa_2){

			logico abajur_acima = linha_atual_personagem == 4 e coluna_atual_personagem == 11 e direcao_olhar == 0
			logico abajur_abaixo = linha_atual_personagem == 6 e coluna_atual_personagem == 11 e direcao_olhar == 2
			logico abajur_direita = linha_atual_personagem == 5 e coluna_atual_personagem == 12 e direcao_olhar == 3
			logico abajur_esquerda = linha_atual_personagem == 5 e coluna_atual_personagem == 10 e direcao_olhar == 1

			se(animacao_inicio_mapa_2){
				//animacoes_jogo()
				tocando_musica_ruins = verdadeiro
				
			}

			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_DIREITA) e coluna_atual_personagem < quantidade_colunas - 1 e nao tem_obstaculo(linha_atual_personagem, coluna_atual_personagem + 1)e nao movimento_frisk){
				coluna_atual_personagem += 1	
				frisk_atual = frisk_andando_direita
				movimento_frisk = verdadeiro
				movimento_direcao = 1
			
			}
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_ESQUERDA) e coluna_atual_personagem > 0 e nao tem_obstaculo(linha_atual_personagem, coluna_atual_personagem - 1)e nao movimento_frisk) {
				coluna_atual_personagem -= 1
				frisk_atual = frisk_andando_esquerda
				movimento_frisk = verdadeiro
				movimento_direcao =3
			}
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_ABAIXO) e linha_atual_personagem < quantidade_linhas - 1 e nao tem_obstaculo(linha_atual_personagem+1, coluna_atual_personagem)e nao movimento_frisk) {
				linha_atual_personagem += 1
				frisk_atual = frisk1
				movimento_frisk = verdadeiro
				movimento_direcao = 0
			}
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_ACIMA) e linha_atual_personagem > 0 e nao tem_obstaculo(linha_atual_personagem - 1, coluna_atual_personagem)e nao movimento_frisk) {
				linha_atual_personagem -= 1
				frisk_atual = frisk_andando_acima
				movimento_frisk = verdadeiro
				movimento_direcao = 2
			}

			se((linha_atual_personagem == 5 e coluna_atual_personagem == 15) ou (linha_atual_personagem == 4 e coluna_atual_personagem == 15)){
				mudar_mapa = verdadeiro
				mapa_2 = falso
				mapa_puzzle_1 = verdadeiro
				lado_do_mapa_aparecer = 1
			}

			se((linha_atual_personagem == 8 e coluna_atual_personagem == 0) ou (linha_atual_personagem == 7 e coluna_atual_personagem == 0) ou (linha_atual_personagem == 6 e coluna_atual_personagem == 0)){
				mudar_mapa = verdadeiro
				mapa_inicial = verdadeiro
				mapa_2 = falso
				lado_do_mapa_aparecer = 1
			}
	
			

			
			se((abajur_acima ou abajur_abaixo ou abajur_direita ou abajur_esquerda)e (Teclado.tecla_pressionada(Teclado.TECLA_Z))){
				abajur_fala = verdadeiro
			}
		}
		
		se(mapa_puzzle_1){

			
			reset_pressionado = (linha_atual_personagem == 2 e coluna_atual_personagem == 10)
			
			//logico sans_mapa_tutorial_direita = ((linha_atual_personagem == 7 e coluna_atual_personagem == 9) e direcao_olhar == 3)
			//logico sans_mapa_tutorial_esquerda = (linha_atual_personagem == 7 e coluna_atual_personagem == 7 e direcao_olhar == 1)
			//logico sans_mapa_tutorial_acima = (linha_atual_personagem == 6 e coluna_atual_personagem == 8 e direcao_olhar == 0)

			logico placa_direita = ((linha_atual_personagem == 4 e coluna_atual_personagem == 3) e direcao_olhar == 3)
			logico placa_esquerda = (linha_atual_personagem == 4 e coluna_atual_personagem == 1 e direcao_olhar == 1)
			logico placa_acima = (linha_atual_personagem == 3 e coluna_atual_personagem == 2 e direcao_olhar == 0)
			logico placa_abaixo = (linha_atual_personagem == 5 e coluna_atual_personagem == 2 e direcao_olhar == 2)
		
		
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_DIREITA) e coluna_atual_personagem < quantidade_colunas - 1 e nao tem_obstaculo(linha_atual_personagem, coluna_atual_personagem + 1)e nao movimento_frisk){
				coluna_atual_personagem += 1	
				se(nao saidas_mapa_1){
					personagem_andou(linha_atual_personagem, coluna_atual_personagem)
				}
				frisk_atual = frisk_andando_direita
				movimento_frisk = verdadeiro
				movimento_direcao = 1
			
			}
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_ESQUERDA) e coluna_atual_personagem > 0 e nao tem_obstaculo(linha_atual_personagem, coluna_atual_personagem - 1)e nao movimento_frisk) {
				coluna_atual_personagem -= 1
				se(nao saidas_mapa_1){
					personagem_andou(linha_atual_personagem, coluna_atual_personagem)
				}
				frisk_atual = frisk_andando_esquerda
				movimento_frisk = verdadeiro
				movimento_direcao = 3
			}
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_ABAIXO) e linha_atual_personagem < quantidade_linhas - 1 e nao tem_obstaculo(linha_atual_personagem+1, coluna_atual_personagem)e nao movimento_frisk) {
				linha_atual_personagem += 1
				se(nao saidas_mapa_1){
					personagem_andou(linha_atual_personagem, coluna_atual_personagem)
				}
				frisk_atual = frisk1
				movimento_frisk = verdadeiro
				movimento_direcao = 0
			}
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_ACIMA) e linha_atual_personagem > 0 e nao tem_obstaculo(linha_atual_personagem - 1, coluna_atual_personagem)e nao movimento_frisk) {
				linha_atual_personagem -= 1
				se(nao saidas_mapa_1){
					personagem_andou(linha_atual_personagem, coluna_atual_personagem)
				}
				frisk_atual = frisk_andando_acima
				movimento_frisk = verdadeiro
				movimento_direcao = 2
			}
			se (linha_atual_personagem == 2 e coluna_atual_personagem == 10) {
				somar_circulo_puzzle()
				se(mapa_puzzle_1){
					se(saidas_mapa_1 == verdadeiro){
						reseta_cor = falso
					
					}
					senao{
						reseta_cor = verdadeiro
						puzzle_completo_somar = 0
					}
				}
				
			}

			se (((placa_esquerda ou placa_direita ou placa_acima ou placa_abaixo) e Teclado.tecla_pressionada(Teclado.TECLA_Z)) ){
			placa_tutorial = verdadeiro
			}
			senao{
				placa_tutorial = falso
			}

			se((linha_atual_personagem == 4 e coluna_atual_personagem == 0) ou (linha_atual_personagem == 5 e coluna_atual_personagem == 0) ){
				mudar_mapa = verdadeiro
				mapa_2 = verdadeiro
				mapa_puzzle_1 = falso
				lado_do_mapa_aparecer = 2
				//testando_texto = verdadeiro
			}
			
			se((linha_atual_personagem == 8 e coluna_atual_personagem == 15) ou (linha_atual_personagem == 7 e coluna_atual_personagem == 15)){
				mudar_mapa = verdadeiro
				mapa_puzzle_1 = falso
				mapa_3 = verdadeiro
				lado_do_mapa_aparecer = 1
			}
			
		}

		se(mapa_3){

			
			reset_pressionado = (linha_atual_personagem == 3 e coluna_atual_personagem == 2)

			logico placa_direita = ((linha_atual_personagem == 5 e coluna_atual_personagem == 3) e direcao_olhar == 3)
			logico placa_esquerda = (linha_atual_personagem == 5 e coluna_atual_personagem == 1 e direcao_olhar == 1)
			logico placa_acima = (linha_atual_personagem == 4 e coluna_atual_personagem == 2 e direcao_olhar == 0)
			logico placa_abaixo = (linha_atual_personagem == 6 e coluna_atual_personagem == 2 e direcao_olhar == 2)

			se(coluna_atual_personagem == 15 e nao mudar_mapa){
				animacao_final()
			}

			
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_DIREITA) e coluna_atual_personagem < quantidade_colunas - 1 e nao tem_obstaculo(linha_atual_personagem, coluna_atual_personagem + 1)e nao movimento_frisk){
				coluna_atual_personagem += 1	
				se(nao saidas_mapa_3){
					personagem_andou(linha_atual_personagem, coluna_atual_personagem)
				}
				frisk_atual = frisk_andando_direita
				movimento_frisk = verdadeiro
				movimento_direcao = 1
			
			}
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_ESQUERDA) e coluna_atual_personagem > 0 e nao tem_obstaculo(linha_atual_personagem, coluna_atual_personagem - 1)e nao movimento_frisk) {
				coluna_atual_personagem -= 1
				se(nao saidas_mapa_3){
					personagem_andou(linha_atual_personagem, coluna_atual_personagem)
				}
				frisk_atual = frisk_andando_esquerda
				movimento_frisk = verdadeiro
				movimento_direcao = 3
			}
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_ABAIXO) e linha_atual_personagem < quantidade_linhas - 1 e nao tem_obstaculo(linha_atual_personagem+1, coluna_atual_personagem)e nao movimento_frisk) {
				linha_atual_personagem += 1
				se(nao saidas_mapa_3){
					personagem_andou(linha_atual_personagem, coluna_atual_personagem)
				}
				frisk_atual = frisk1
				movimento_frisk = verdadeiro
				movimento_direcao = 0
			}
			se (Teclado.tecla_pressionada(Teclado.TECLA_SETA_ACIMA) e linha_atual_personagem > 0 e nao tem_obstaculo(linha_atual_personagem - 1, coluna_atual_personagem)e nao movimento_frisk) {
				linha_atual_personagem -= 1
				se(nao saidas_mapa_3){
					personagem_andou(linha_atual_personagem, coluna_atual_personagem)
				}
				frisk_atual = frisk_andando_acima
				movimento_frisk = verdadeiro
				movimento_direcao = 2
			}
			se (linha_atual_personagem == 3 e coluna_atual_personagem == 2) {
				somar_circulo_puzzle()
				se(mapa_3){
					se(saidas_mapa_3 == verdadeiro){
						reseta_cor_2 = falso
					
					}
					senao{
						reseta_cor_2 = verdadeiro
						puzzle_completo_somar_2 = 0
					}
				}
				
			}

			se (((placa_esquerda ou placa_direita ou placa_acima ou placa_abaixo) e Teclado.tecla_pressionada(Teclado.TECLA_Z)) ){
			placa_tutorial = verdadeiro
			}
			senao{
				placa_tutorial = falso
			}

			se((linha_atual_personagem == 7 e coluna_atual_personagem == 0) ou (linha_atual_personagem == 8 e coluna_atual_personagem == 0) ){
				mudar_mapa = verdadeiro
				mapa_2 = falso
				mapa_3 = falso
				lado_do_mapa_aparecer = 2
				mapa_puzzle_1 = verdadeiro
				voltando_mapa_3 = verdadeiro
				
				
				//testando_texto = verdadeiro
			}
		}

		se(mudar_mapa){
			se(mapa_inicial){
				se(lado_do_mapa_aparecer == 1){
					//linha_atual_personagem = 7
					coluna_atual_personagem = 14
					direcao_olhar = 3
					mudar_mapa = falso
				}
			}

			se(mapa_2 ou voltando_mapa_3){
				se(lado_do_mapa_aparecer == 1){
					se(animacao_inicio_mapa_2){
						coluna_atual_personagem = 12
						direcao_olhar = 3
						mudar_mapa = falso
						animacao_inicio_mapa_2 = falso
					}
					senao{
						//linha_atual_personagem = 7
						coluna_atual_personagem = 1
						direcao_olhar = 3
						mudar_mapa = falso
					}
				}
				se(lado_do_mapa_aparecer == 2){
					coluna_atual_personagem = 14
					direcao_olhar = 1
					mudar_mapa = falso
					tocando_musica_ruins = falso
				}
			}
			
			se(mapa_puzzle_1){
				se(lado_do_mapa_aparecer == 1){
					coluna_atual_personagem = 1
					direcao_olhar = 1
					mudar_mapa = falso
					tocando_musica_snowdin = falso
				}
				se(lado_do_mapa_aparecer == 2){
					coluna_atual_personagem = 14
					direcao_olhar = 3
					mudar_mapa = falso
				}
				
			}
			se(mapa_3){
				se(lado_do_mapa_aparecer == 1){
					coluna_atual_personagem = 1
					mudar_mapa = falso
				}
			}
		}

	}

	funcao desenhar()
	{
	
		Graficos.definir_cor(Graficos.COR_BRANCO)		
		Graficos.limpar()

		se(mapa_inicial){

			Graficos.desenhar_imagem(0, 0, mapa0)
			se(nao movimento_frisk){
				Graficos.desenhar_imagem(coluna_atual_personagem*sqm, linha_atual_personagem*sqm - 64, frisk_atual)
			}
			senao{
				se(movimento_direcao == 0){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm, (linha_atual_personagem*sqm-64)-sqm/2, frisk_abaixo_2_gameplay)
					
				}
				se(movimento_direcao == 1){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm-sqm/2, (linha_atual_personagem*sqm-64), frisk_direita_2_gameplay)
					
				}

				se(movimento_direcao == 2){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm, (linha_atual_personagem*sqm-64+sqm/2), frisk_acima_2_gameplay)
					
				}
				se(movimento_direcao == 3){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm+sqm/2, (linha_atual_personagem*sqm-64), frisk_esquerda_2_gameplay)
					
				}

				movimento_frisk = falso
			}

			
			Graficos.renderizar()
			se(nao tocando_musica_ruins){
				Sons.definir_volume(100)
				Sons.interromper_som(musica_mapa_gelo)
				Sons.reproduzir_som(musica_ruinas, verdadeiro)
				tocando_musica_ruins = verdadeiro
			}
		}

		se(mapa_2){

			Graficos.desenhar_imagem(0, 0, mapa2)
			se(linha_atual_personagem > 4){
				Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			}
			se(nao movimento_frisk){
				Graficos.desenhar_imagem(coluna_atual_personagem*sqm, linha_atual_personagem*sqm - 64, frisk_atual)
			}
			senao{
				se(movimento_direcao == 0){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm, (linha_atual_personagem*sqm-64)-sqm/2, frisk_abaixo_2_gameplay)
					
				}
				se(movimento_direcao == 1){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm-sqm/2, (linha_atual_personagem*sqm-64), frisk_direita_2_gameplay)
					
				}

				se(movimento_direcao == 2){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm, (linha_atual_personagem*sqm-64+sqm/2), frisk_acima_2_gameplay)
					
				}
				se(movimento_direcao == 3){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm+sqm/2, (linha_atual_personagem*sqm-64), frisk_esquerda_2_gameplay)
					
				}

				movimento_frisk = falso
			}
			se(linha_atual_personagem <= 4){
				Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			}

			se(abajur_fala == verdadeiro){
				inteiro caixa_de_texto_abajur = Graficos.carregar_imagem("imagens/sprites/falas/abajur_fala.png")
				Graficos.desenhar_imagem(125, 100, caixa_de_texto_abajur)
				aguardar_fala_personagem = verdadeiro
				abajur_fala = falso
			}
			
			Graficos.renderizar()

			se(aguardar_fala_personagem){
				Util.aguarde(1000)
				aguardar_fala_personagem = falso
			}

			se(nao tocando_musica_ruins){
				Sons.definir_volume(100)
				Sons.interromper_som(musica_mapa_gelo)
				Sons.reproduzir_som(musica_ruinas, verdadeiro)
				tocando_musica_ruins = verdadeiro
			}

		}

		se(mapa_puzzle_1){

			se(nao tocando_musica_snowdin){
				Sons.definir_volume(70)
				Sons.interromper_som(musica_ruinas)
				Sons.reproduzir_som(musica_mapa_gelo, verdadeiro)
				tocando_musica_snowdin = verdadeiro
			}

			Graficos.desenhar_imagem(0, 0, mapa1)
			
			Graficos.definir_cor(Graficos.COR_AMARELO)
			se(reset_pressionado){
				Graficos.desenhar_imagem(10*sqm, 2*sqm, reset_pressionado_imagem)
				som_reset += 1
				se(som_reset == 1){
					Sons.definir_volume(90)
					Sons.reproduzir_som(resetando, falso)
					Sons.definir_volume(70)
				}
				
			}
			senao{
				Graficos.desenhar_imagem(10*sqm, 2*sqm, reset)
				som_reset = 0
			}
		
			Graficos.definir_cor(Graficos.COR_AZUL)
		
			Graficos.desenhar_imagem(10*sqm, 4*sqm, pedra)
			
			Graficos.desenhar_imagem(10*sqm, 3*sqm, pedra)
			Graficos.desenhar_imagem(10*sqm, 5*sqm, pedra)			
			
			Graficos.desenhar_imagem(11*sqm, 3*sqm, pedra)
			Graficos.desenhar_imagem(12*sqm, 3*sqm, pedra)
			Graficos.desenhar_imagem(13*sqm, 3*sqm, pedra)
				
			Graficos.desenhar_imagem(9*sqm, 3*sqm, pedra)
			Graficos.desenhar_imagem(8*sqm, 3*sqm, pedra)
			Graficos.desenhar_imagem(7*sqm, 3*sqm, pedra)

			Graficos.desenhar_imagem(9*sqm, 5*sqm, pedra)
			Graficos.desenhar_imagem(8*sqm, 5*sqm, pedra)
			Graficos.desenhar_imagem(7*sqm, 5*sqm, pedra)

			Graficos.desenhar_imagem(11*sqm, 5*sqm, pedra)
			Graficos.desenhar_imagem(12*sqm, 5*sqm, pedra)
			Graficos.desenhar_imagem(13*sqm, 5*sqm, pedra)

			saidas()

		

			se (reseta_cor) {
				para (inteiro i = 0; i < 10; i++) {
					para (inteiro j = 0; j < 16; j++) {
						se (puzzles[i][j] != -1) {
							puzzles[i][j] = 0
						}
					}
				}
				reseta_cor = falso
			}

			se(nao saidas_mapa_1){
				para (inteiro i = 0; i < 10; i++) {
					para (inteiro j = 0; j < 16; j++) {
						escolha (puzzles[i][j]) {
							caso (piso_x): {
								Graficos.desenhar_imagem(sqm * j, sqm * i, X)
							}
							caso (piso_o): {
								Graficos.desenhar_imagem(sqm * j, sqm * i, O)
							}
							caso (piso_t): {
								Graficos.desenhar_imagem(sqm * j, sqm * i, triangulo)
							}
						}
					}
				}
			}
			senao{
				
					Graficos.desenhar_imagem(sqm * 8, sqm * 4, circulo_verde)
					Graficos.desenhar_imagem(sqm * 12, sqm * 4, circulo_verde)
			}

			

		
			Graficos.definir_cor(Graficos.COR_PRETO)
			
			se(nao movimento_frisk){
				Graficos.desenhar_imagem(coluna_atual_personagem*sqm, linha_atual_personagem*sqm - 64, frisk_atual)
			}
			senao{
				se(movimento_direcao == 0){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm, (linha_atual_personagem*sqm-64)-sqm/2, frisk_abaixo_2_gameplay)
					
				}
				se(movimento_direcao == 1){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm-sqm/2, (linha_atual_personagem*sqm-64), frisk_direita_2_gameplay)
					
				}

				se(movimento_direcao == 2){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm, (linha_atual_personagem*sqm-64+sqm/2), frisk_acima_2_gameplay)
					
				}
				se(movimento_direcao == 3){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm+sqm/2, (linha_atual_personagem*sqm-64), frisk_esquerda_2_gameplay)
					
				}

				movimento_frisk = falso
			}

			se(testando_texto){
				Graficos.desenhar_texto(100, 200, "Você não pode passar")
			}

		
			//Graficos.desenhar_imagem(coluna_atual_personagem*sqm, (linha_atual_personagem-1)*sqm, frisk2)

			//Graficos.desenhar_imagem(8*sqm, 6*sqm, sans_npc)
			se(placa_tutorial == verdadeiro){
				Graficos.desenhar_imagem(125, 100, fala_caixa_de_texto_tutorial)
				aguardar_fala_personagem = verdadeiro
			}

		
			Graficos.renderizar()
			se(aguardar_fala_personagem){
				Util.aguarde(6000)
				aguardar_fala_personagem = falso
			}
		
		}

		se(mapa_3){

			se(nao tocando_musica_snowdin){
				Sons.definir_volume(70)
				Sons.interromper_som(musica_ruinas)
				Sons.reproduzir_som(musica_mapa_gelo, verdadeiro)
				tocando_musica_snowdin = verdadeiro
			}
			
			Graficos.desenhar_imagem(0, 0, mapa3)

			
			se(reset_pressionado){
				Graficos.desenhar_imagem(2*sqm, 3*sqm, reset_pressionado_imagem)
				som_reset += 1
				se(som_reset == 1){
					Sons.definir_volume(90)
					Sons.reproduzir_som(resetando, falso)
					Sons.definir_volume(70)
				}
				
			}
			senao{
				Graficos.desenhar_imagem(2*sqm, 3*sqm, reset)
				som_reset = 0
			}
			Graficos.desenhar_imagem(4*sqm, 3*sqm, pedra)
			Graficos.desenhar_imagem(4*sqm, 4*sqm, pedra)
			Graficos.desenhar_imagem(4*sqm, 5*sqm, pedra)

			Graficos.desenhar_imagem(5*sqm, 2*sqm, pedra)
			Graficos.desenhar_imagem(6*sqm, 2*sqm, pedra)
			Graficos.desenhar_imagem(7*sqm, 2*sqm, pedra)
			Graficos.desenhar_imagem(8*sqm, 2*sqm, pedra)

			Graficos.desenhar_imagem(10*sqm, 2*sqm, pedra)
			Graficos.desenhar_imagem(11*sqm, 2*sqm, pedra)

			Graficos.desenhar_imagem(6*sqm, 4*sqm, pedra)
			Graficos.desenhar_imagem(7*sqm, 4*sqm, pedra)
			Graficos.desenhar_imagem(8*sqm, 4*sqm, pedra)
			
			Graficos.desenhar_imagem(10*sqm, 4*sqm, pedra)

			Graficos.desenhar_imagem(12*sqm, 3*sqm, pedra)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, pedra)
			Graficos.desenhar_imagem(12*sqm, 5*sqm, pedra)
		
			Graficos.desenhar_imagem(11*sqm, 6*sqm, pedra)

			Graficos.desenhar_imagem(8*sqm, 6*sqm, pedra)
			Graficos.desenhar_imagem(7*sqm, 6*sqm, pedra)

			Graficos.desenhar_imagem(3*sqm, 8*sqm, pedra)
			Graficos.desenhar_imagem(4*sqm, 8*sqm, pedra)
			Graficos.desenhar_imagem(5*sqm, 8*sqm, pedra)
			Graficos.desenhar_imagem(6*sqm, 8*sqm, pedra)
			Graficos.desenhar_imagem(7*sqm, 8*sqm, pedra)
			Graficos.desenhar_imagem(8*sqm, 8*sqm, pedra)
			Graficos.desenhar_imagem(9*sqm, 8*sqm, pedra)

			saidas()

			
			se (reseta_cor_2) {
				para (inteiro i = 0; i < 10; i++) {
					para (inteiro j = 0; j < 16; j++) {
						se (puzzles_mapa_3[i][j] != -1) {
							puzzles_mapa_3[i][j] = 0
						}
					}
				}
				reseta_cor_2 = falso
			}

			se(nao saidas_mapa_3){
				para (inteiro i = 0; i < 10; i++) {
					para (inteiro j = 0; j < 16; j++) {
						escolha (puzzles_mapa_3[i][j]) {
							caso (piso_x): {
								Graficos.desenhar_imagem(sqm * j, sqm * i, X)
							}
							caso (piso_o): {
								Graficos.desenhar_imagem(sqm * j, sqm * i, O)
							}
							caso (piso_t): {
								Graficos.desenhar_imagem(sqm * j, sqm * i, triangulo)
							}
						}
					}
				}
			}
			senao{				
					Graficos.desenhar_imagem(sqm * 6, sqm * 3, circulo_verde)
					Graficos.desenhar_imagem(sqm * 6, sqm * 6, circulo_verde)
					Graficos.desenhar_imagem(sqm * 6, sqm * 7, circulo_verde)
					Graficos.desenhar_imagem(sqm * 7, sqm * 5, circulo_verde)
					Graficos.desenhar_imagem(sqm * 7, sqm * 7, circulo_verde)
					Graficos.desenhar_imagem(sqm * 9, sqm * 3, circulo_verde)
					Graficos.desenhar_imagem(sqm * 9, sqm * 4, circulo_verde)
					Graficos.desenhar_imagem(sqm * 9, sqm * 5, circulo_verde)
					Graficos.desenhar_imagem(sqm * 9, sqm * 7, circulo_verde)
					Graficos.desenhar_imagem(sqm * 10, sqm * 5, circulo_verde)
					Graficos.desenhar_imagem(sqm * 11, sqm * 3, circulo_verde)
					Graficos.desenhar_imagem(sqm * 11, sqm * 4, circulo_verde)
					Graficos.desenhar_imagem(sqm * 11, sqm * 5, circulo_verde)
					Graficos.desenhar_imagem(sqm * 8, sqm * 7, circulo_verde)
					
			}


			se(nao movimento_frisk){
				Graficos.desenhar_imagem(coluna_atual_personagem*sqm, linha_atual_personagem*sqm - 64, frisk_atual)
			}
			senao{
				se(movimento_direcao == 0){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm, (linha_atual_personagem*sqm-64)-sqm/2, frisk_abaixo_2_gameplay)
					
				}
				se(movimento_direcao == 1){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm-sqm/2, (linha_atual_personagem*sqm-64), frisk_direita_2_gameplay)
					
				}

				se(movimento_direcao == 2){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm, (linha_atual_personagem*sqm-64+sqm/2), frisk_acima_2_gameplay)
					
				}
				se(movimento_direcao == 3){
					Graficos.desenhar_imagem(coluna_atual_personagem*sqm+sqm/2, (linha_atual_personagem*sqm-64), frisk_esquerda_2_gameplay)
					
				}

				movimento_frisk = falso
			}

			se(placa_tutorial == verdadeiro){
				Graficos.desenhar_imagem(125, 100, fala_caixa_de_texto_tutorial)
				aguardar_fala_personagem = verdadeiro
			}
			
			Graficos.renderizar()

			se(aguardar_fala_personagem){
				Util.aguarde(6000)
				aguardar_fala_personagem = falso
			}

		}

		

	}

	funcao animacoes_jogo()
	{
		inteiro sans_escuro_1 = Graficos.carregar_imagem("imagens/sprites/sans_animacao/sans_escuro_1.png")
		inteiro sans_escuro_2 = Graficos.carregar_imagem("imagens/sprites/sans_animacao/sans_escuro_2.png")
		se(mapa_2){


			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(1*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.renderizar()
			Util.aguarde(1000)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(1*sqm+sqm/2, 8*sqm-1*sqm, andando_2_frisk)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.renderizar()
			Util.aguarde(150)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(2*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.renderizar()
			Util.aguarde(150)
			Sons.pausar_som(musica_ruinas)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(2*sqm+sqm/2, 8*sqm-1*sqm, andando_2_frisk)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.renderizar()
			Util.aguarde(150)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(15*sqm+sqm/2, 7*sqm, sans_escuro_1)
			Graficos.renderizar()
			Util.aguarde(150)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(15*sqm, 7*sqm, sans_escuro_2)
			Graficos.renderizar()
			Util.aguarde(1000)
			Sons.definir_volume(50)
			inteiro sans_andando_neve = Sons.carregar_som("sons/mapa_2_inicio/sans_neve_andando.mp3")
			Sons.reproduzir_som(sans_andando_neve, falso)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(14*sqm+sqm/2, 7*sqm, sans_escuro_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(14*sqm, 7*sqm, sans_escuro_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(13*sqm+sqm/2, 7*sqm, sans_escuro_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(13*sqm, 7*sqm, sans_escuro_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(12*sqm+sqm/2, 7*sqm, sans_escuro_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(12*sqm, 7*sqm, sans_escuro_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(11*sqm+sqm/2, 7*sqm, sans_escuro_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(11*sqm, 7*sqm, sans_escuro_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(10*sqm+sqm/2, 7*sqm, sans_escuro_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(10*sqm, 7*sqm, sans_escuro_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(9*sqm+sqm/2, 7*sqm, sans_escuro_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(9*sqm, 7*sqm, sans_escuro_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(8*sqm+sqm/2, 7*sqm, sans_escuro_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(8*sqm, 7*sqm, sans_escuro_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(7*sqm+sqm/2, 7*sqm, sans_escuro_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(7*sqm, 7*sqm, sans_escuro_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(6*sqm+sqm/2, 7*sqm, sans_escuro_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(6*sqm, 7*sqm, sans_escuro_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(5*sqm+sqm/2, 7*sqm, sans_escuro_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(5*sqm, 7*sqm, sans_escuro_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm+sqm/2, 7*sqm, sans_escuro_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_escuro_2)
			Graficos.renderizar()
			Util.aguarde(200)
			
			inteiro fala_sans_inicio_1 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_1.png")
			inteiro sans_escuro_mao = Graficos.carregar_imagem("imagens/sprites/sans_animacao/sans_escuro_mao.png")
			
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_escuro_2)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_1)
			Graficos.renderizar()
			Util.aguarde(1000)
			
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_escuro_mao)
			Graficos.renderizar()
			Util.aguarde(1000)
			inteiro frisk_mao = Graficos.carregar_imagem("imagens/sprites/sans_animacao/frisk_mao.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_mao)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_escuro_mao)
			Graficos.renderizar()
			Util.aguarde(100)
			inteiro sans_pum = Sons.carregar_som("sons/mapa_2_inicio/sans_pum.mp3")
			inteiro sans_mao = Graficos.carregar_imagem("imagens/sprites/sans_animacao/sans_mao.png")

					//liberar ja usado
			Graficos.liberar_imagem(sans_escuro_mao)
			Graficos.liberar_imagem(fala_sans_inicio_1)
			Graficos.liberar_imagem(sans_escuro_1)
			Graficos.liberar_imagem(sans_escuro_1)
			Sons.liberar_som(sans_andando_neve)

			Sons.definir_volume(75)
			Sons.reproduzir_som(sans_pum, falso)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_mao)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_mao)
			Graficos.renderizar()
			Util.aguarde(6000)

			Sons.definir_volume(100)
			inteiro tema_sans = Sons.carregar_som("sons/tema_sans.mp3")
			inteiro sans_esquerda = Graficos.carregar_imagem("imagens/sprites/sans_animacao/sans_esquerda.png")
			Sons.definir_volume(75)
			Sons.reproduzir_som(tema_sans, verdadeiro)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.renderizar()
			Util.aguarde(1000)
			
			inteiro fala_sans_inicio_2 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_2.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_2)
			Graficos.renderizar()
			Util.aguarde(3000)

			Graficos.liberar_imagem(fala_sans_inicio_2)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.renderizar()
			Util.aguarde(1000)

			inteiro fala_sans_inicio_3 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_3.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_3)
			Graficos.renderizar()
			Util.aguarde(3000)

			Graficos.liberar_imagem(fala_sans_inicio_3)
			inteiro fala_sans_inicio_4 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_4.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_4)
			Graficos.renderizar()
			Util.aguarde(3000)

			Graficos.liberar_imagem(fala_sans_inicio_4)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.renderizar()
			Util.aguarde(1000)

			inteiro fala_sans_inicio_5 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_5.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_5)
			Graficos.renderizar()
			Util.aguarde(3000)

			Graficos.liberar_imagem(fala_sans_inicio_5)
			inteiro fala_sans_inicio_6 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_6.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_6)
			Graficos.renderizar()
			Util.aguarde(3000)

			Graficos.liberar_imagem(fala_sans_inicio_6)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.renderizar()
			Util.aguarde(1000)

			inteiro fala_sans_inicio_7 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_7.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_7)
			Graficos.renderizar()
			Util.aguarde(3000)

			Graficos.liberar_imagem(fala_sans_inicio_7)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.renderizar()
			Util.aguarde(1000)

			inteiro fala_sans_inicio_8 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_8.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_8)
			Graficos.renderizar()
			Util.aguarde(3000)

			Graficos.liberar_imagem(fala_sans_inicio_8)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.renderizar()
			Util.aguarde(1000)

			inteiro fala_sans_inicio_9 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_9.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_9)
			Graficos.renderizar()
			Util.aguarde(3000)

			Graficos.liberar_imagem(fala_sans_inicio_9)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.renderizar()
			Util.aguarde(1000)

			inteiro fala_sans_inicio_10 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_10.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_10)
			Graficos.renderizar()
			Util.aguarde(3000)

			Graficos.liberar_imagem(fala_sans_inicio_10)
			inteiro fala_sans_inicio_11 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_11.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_11)
			Graficos.renderizar()
			Util.aguarde(3000)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 8*sqm-1*sqm, frisk_atual)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_esquerda)
			Graficos.renderizar()


			inteiro frisk_cima_1 = Graficos.carregar_imagem("imagens/sprites/movimento/cima_1.png")
			inteiro frisk_cima_2 = Graficos.carregar_imagem("imagens/sprites/movimento/cima_2.png")
			inteiro frisk_cima_3 = Graficos.carregar_imagem("imagens/sprites/movimento/cima_3.png")
			inteiro frisk_cima_4 = Graficos.carregar_imagem("imagens/sprites/movimento/cima_4.png")
			inteiro frisk_direita_1 = Graficos.carregar_imagem("imagens/sprites/movimento/direita_1.png")
			inteiro frisk_direita_2 = Graficos.carregar_imagem("imagens/sprites/movimento/direita_2.png")
			inteiro sans_direita = Graficos.carregar_imagem("imagens/sprites/sans_animacao/sans_direita.png")

						//indo se esconder no abajur

			Graficos.liberar_imagem(fala_sans_inicio_10)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 6*sqm+sqm/2, frisk_cima_2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm, 6*sqm, frisk_cima_3)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)

			//direita

			Graficos.liberar_imagem(fala_sans_inicio_10)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(3*sqm+sqm/2, 6*sqm, frisk_direita_2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(4*sqm, 6*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.liberar_imagem(fala_sans_inicio_10)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(4*sqm+sqm/2, 6*sqm, frisk_direita_2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(5*sqm, 6*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.liberar_imagem(fala_sans_inicio_10)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(5*sqm+sqm/2, 6*sqm, frisk_direita_2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(6*sqm, 6*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.liberar_imagem(fala_sans_inicio_10)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(6*sqm+sqm/2, 6*sqm, frisk_direita_2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(7*sqm, 6*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.liberar_imagem(fala_sans_inicio_10)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(7*sqm+sqm/2, 6*sqm, frisk_direita_2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(8*sqm, 6*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.liberar_imagem(fala_sans_inicio_10)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(8*sqm+sqm/2, 6*sqm, frisk_direita_2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(9*sqm, 6*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)	

			//direita
			
			Graficos.liberar_imagem(fala_sans_inicio_10)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(9*sqm, 5*sqm+sqm/2, frisk_cima_4)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(9*sqm, 5*sqm, frisk_cima_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.liberar_imagem(fala_sans_inicio_10)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(9*sqm, 4*sqm+sqm/2, frisk_cima_2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(9*sqm, 4*sqm, frisk_cima_3)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.liberar_imagem(fala_sans_inicio_10)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(9*sqm+sqm/2, 4*sqm, frisk_direita_2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(10*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)	
			Graficos.liberar_imagem(fala_sans_inicio_10)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(10*sqm+sqm/2, 4*sqm, frisk_direita_2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			//Graficos.desenhar_imagem(10*sqm, 4*sqm, frisk_direita_1) frisk escondida
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(200)

			inteiro papyrus_esquerda_1 = Graficos.carregar_imagem("imagens/sprites/sans_animacao/papyrus_esquerda_1.png")
			inteiro papyrus_esquerda_2 = Graficos.carregar_imagem("imagens/sprites/sans_animacao/papyrus_esquerda_2.png")


			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(16*sqm, 7*sqm, papyrus_esquerda_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(16*sqm-sqm/2, 7*sqm, papyrus_esquerda_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(15*sqm, 7*sqm, papyrus_esquerda_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(15*sqm-sqm/2, 7*sqm, papyrus_esquerda_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(14*sqm, 7*sqm, papyrus_esquerda_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(14*sqm-sqm/2, 7*sqm, papyrus_esquerda_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(13*sqm, 7*sqm, papyrus_esquerda_1)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(13*sqm-sqm/2, 7*sqm, papyrus_esquerda_2)
			Graficos.renderizar()
			Util.aguarde(100)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(12*sqm, 7*sqm, papyrus_esquerda_1)
			Graficos.renderizar()
			Util.aguarde(1000)

			//falas papyrus

			inteiro fala_papyrus_inicio_1 = Graficos.carregar_imagem("imagens/sprites/falas/fala_papyrus_inicio_1.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(12*sqm, 7*sqm, papyrus_esquerda_1)
			Graficos.desenhar_imagem(125, 100, fala_papyrus_inicio_1)
			Graficos.renderizar()
			Util.aguarde(3000)

			Graficos.liberar_imagem(fala_papyrus_inicio_1)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(12*sqm, 7*sqm, papyrus_esquerda_1)
			Graficos.renderizar()
			Util.aguarde(1000)

			inteiro fala_papyrus_inicio_2 = Graficos.carregar_imagem("imagens/sprites/falas/fala_papyrus_inicio_2.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(12*sqm, 7*sqm, papyrus_esquerda_1)
			Graficos.desenhar_imagem(125, 100, fala_papyrus_inicio_2)
			Graficos.renderizar()
			Util.aguarde(3000)

			Graficos.liberar_imagem(fala_papyrus_inicio_2)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(12*sqm, 7*sqm, papyrus_esquerda_1)
			Graficos.renderizar()
			Util.aguarde(1000)

			inteiro fala_sans_inicio_12 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_12.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(12*sqm, 7*sqm, papyrus_esquerda_1)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_12)
			Graficos.renderizar()
			Util.aguarde(2000)

			Graficos.liberar_imagem(fala_sans_inicio_12)
			inteiro fala_sans_inicio_13 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_13.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(12*sqm, 7*sqm, papyrus_esquerda_1)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_13)
			Graficos.renderizar()
			Util.aguarde(2000)

			inteiro fala_sans_inicio_14 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_14.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(12*sqm, 7*sqm, papyrus_esquerda_1)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_14)
			Graficos.renderizar()
			Util.aguarde(3000)

			inteiro incrivel_papyrus = Graficos.carregar_imagem("imagens/sprites/sans_animacao/incrivel_papyrus.png")
			
			Graficos.liberar_imagem(fala_sans_inicio_14)
			inteiro fala_sans_inicio_15 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_15.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(12*sqm, 7*sqm, incrivel_papyrus)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_15)
			Graficos.renderizar()
			Util.aguarde(3000)

			Graficos.liberar_imagem(fala_sans_inicio_15)
			inteiro fala_papyrus_inicio_3 = Graficos.carregar_imagem("imagens/sprites/falas/fala_papyrus_inicio_3.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(12*sqm, 7*sqm, papyrus_esquerda_1)
			Graficos.desenhar_imagem(125, 100, fala_papyrus_inicio_3)
			Graficos.renderizar()
			Util.aguarde(2000)

			inteiro papyrus_direita_1 = Graficos.carregar_imagem("imagens/sprites/sans_animacao/papyrus_direita_1.png")
			inteiro papyrus_direita_2 = Graficos.carregar_imagem("imagens/sprites/sans_animacao/papyrus_direita_2.png")
			
			
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(12*sqm, 7*sqm, papyrus_direita_1)
			Graficos.renderizar()
			Util.aguarde(1000)

			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(12*sqm+sqm/2, 7*sqm, papyrus_direita_2)
			Graficos.renderizar()
			Util.aguarde(100)

			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(13*sqm, 7*sqm, papyrus_direita_1)
			Graficos.renderizar()
			Util.aguarde(100)

			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(13*sqm+sqm/2, 7*sqm, papyrus_direita_2)
			Graficos.renderizar()
			Util.aguarde(100)

			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(14*sqm, 7*sqm, papyrus_direita_1)
			Graficos.renderizar()
			Util.aguarde(100)

			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(14*sqm+sqm/2, 7*sqm, papyrus_direita_2)
			Graficos.renderizar()
			Util.aguarde(100)

			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(15*sqm, 7*sqm, papyrus_direita_1)
			Graficos.renderizar()
			Util.aguarde(100)

			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(15*sqm+sqm/2, 7*sqm, papyrus_direita_2)
			Graficos.renderizar()
			Util.aguarde(100)

			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(16*sqm, 7*sqm, papyrus_direita_1)
			Graficos.renderizar()
			Util.aguarde(100)

			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(16*sqm+sqm/2, 7*sqm, papyrus_direita_1)
			Graficos.renderizar()
			Util.aguarde(100)

			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(2000)

			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(11*sqm+sqm/2, 4*sqm, frisk_direita_2)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)

			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(100)

			inteiro fala_sans_inicio_16 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_16.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_16)
			Graficos.renderizar()
			Util.aguarde(2000)

			Graficos.liberar_imagem(fala_sans_inicio_16)
			inteiro fala_sans_inicio_17 = Graficos.carregar_imagem("imagens/sprites/falas/fala_sans_inicio_17.png")
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.desenhar_imagem(125, 100, fala_sans_inicio_17)
			Graficos.renderizar()
			Util.aguarde(2000)

			inteiro sans_direita_2 = Graficos.carregar_imagem("imagens/sprites/sans_animacao/sans_direita_2.png")

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(4*sqm+sqm/2, 7*sqm, sans_direita_2)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(5*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(5*sqm+sqm/2, 7*sqm, sans_direita_2)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(6*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(6*sqm+sqm/2, 7*sqm, sans_direita_2)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(7*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(7*sqm+sqm/2, 7*sqm, sans_direita_2)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(8*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(8*sqm+sqm/2, 7*sqm, sans_direita_2)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(9*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(9*sqm+sqm/2, 7*sqm, sans_direita_2)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(10*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(10*sqm+sqm/2, 7*sqm, sans_direita_2)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(11*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(11*sqm+sqm/2, 7*sqm, sans_direita_2)
			Graficos.renderizar()
			Util.aguarde(150)
			
			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(12*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(12*sqm+sqm/2, 7*sqm, sans_direita_2)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(13*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(13*sqm+sqm/2, 7*sqm, sans_direita_2)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(14*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(14*sqm+sqm/2, 7*sqm, sans_direita_2)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(15*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(15*sqm+sqm/2, 7*sqm, sans_direita_2)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(16*sqm, 7*sqm, sans_direita)
			Graficos.renderizar()
			Util.aguarde(150)

			Graficos.liberar_imagem(fala_sans_inicio_17)
			Graficos.desenhar_imagem(0, 0, mapa2)
			Graficos.desenhar_imagem(12*sqm, 4*sqm, frisk_direita_1)
			Graficos.desenhar_imagem(11*sqm, 4*sqm, abajur)
			Graficos.desenhar_imagem(16*sqm+sqm/2, 7*sqm, sans_direita_2)
			Graficos.renderizar()
			Util.aguarde(150)


			Sons.interromper_som(tema_sans)
			
		}
	}
	
	funcao logico tem_obstaculo(inteiro linha, inteiro coluna)
	{
		se(mapa_inicial){
			retorne obstaculos_mapa_0[linha][coluna] != -1
		}
		se(mapa_puzzle_1){
			retorne obstaculos_mapa_1[linha][coluna] != -1
		}
		se(mapa_2){
			retorne obstaculos_mapa_2[linha][coluna] != -1
		}
		se(mapa_3){
			retorne obstaculos_mapa_3[linha][coluna] != -1
		}
		retorne falso
	}
	
	funcao personagem_andou(inteiro linha, inteiro coluna)
	{
		
		se(mapa_puzzle_1) {	
			escolha (puzzles[linha][coluna]) {
				caso (piso_x): {
					puzzles[linha][coluna] = piso_o
					puzzle_completo_somar += 1
					pare
				}
				caso (piso_o): {
					puzzles[linha][coluna] = piso_t
					puzzle_completo_somar -= 1
					pare
				}
			}
		}
		
		se(mapa_3) {		
		
			escolha (puzzles_mapa_3[linha][coluna]) {
					caso (piso_x): {
						puzzles_mapa_3[linha][coluna] = piso_o
						puzzle_completo_somar_2 += 1
						pare
					}
					caso (piso_o): {
						puzzles_mapa_3[linha][coluna] = piso_t
						puzzle_completo_somar_2 -= 1
						pare
					}
				}
			}
	}

	funcao direcao_olhar_personagem()
	{
		se(Teclado.tecla_pressionada(Teclado.TECLA_SETA_ABAIXO)){
			direcao_olhar = 0
			frisk_atual = frisk1
		}
		se(Teclado.tecla_pressionada(Teclado.TECLA_SETA_DIREITA)){
			direcao_olhar = 1
			frisk_atual = frisk_andando_direita
		}
		se(Teclado.tecla_pressionada(Teclado.TECLA_SETA_ACIMA)){
			direcao_olhar = 2
			frisk_atual = frisk_andando_acima
		}
		se(Teclado.tecla_pressionada(Teclado.TECLA_SETA_ESQUERDA)){
			direcao_olhar = 3
			frisk_atual = frisk_andando_esquerda
		}
	}

	funcao saidas()
	{
		se(mapa_puzzle_1){	
			se(saidas_mapa_1){
				abrindo_saidas_som += 1
				
				se(abrindo_saidas_som == 1){
					Sons.reproduzir_som(abrindo_saidas, falso)
				}
				
				Graficos.desenhar_imagem(15*sqm, 7*sqm, sem_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 8*sqm, sem_bloqueio)
				obstaculos_mapa_1[7][15] = -1
				obstaculos_mapa_1[8][15] = -1
			}
			senao{
				Graficos.desenhar_imagem(15*sqm, 7*sqm, com_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 8*sqm, com_bloqueio)
			}
		}
		se(mapa_3){	
			se(saidas_mapa_3){
				abrindo_saidas_som_2 += 1
				
				se(abrindo_saidas_som_2 == 1){
					Sons.reproduzir_som(abrindo_saidas, falso)
				}
				
				Graficos.desenhar_imagem(15*sqm, 1*sqm, sem_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 2*sqm, sem_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 3*sqm, sem_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 4*sqm, sem_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 5*sqm, sem_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 6*sqm, sem_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 7*sqm, sem_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 8*sqm, sem_bloqueio)
				obstaculos_mapa_3[1][15] = -1
				obstaculos_mapa_3[2][15] = -1
				obstaculos_mapa_3[3][15] = -1
				obstaculos_mapa_3[4][15] = -1
				obstaculos_mapa_3[5][15] = -1
				obstaculos_mapa_3[6][15] = -1
				obstaculos_mapa_3[7][15] = -1
				obstaculos_mapa_3[8][15] = -1
			}
			senao{
				Graficos.desenhar_imagem(15*sqm, 1*sqm, com_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 2*sqm, com_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 3*sqm, com_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 4*sqm, com_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 5*sqm, com_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 6*sqm, com_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 7*sqm, com_bloqueio)
				Graficos.desenhar_imagem(15*sqm, 8*sqm, com_bloqueio)
			}
		}
		
	}

	funcao somar_circulo_puzzle()
	{
		se(mapa_puzzle_1){
			se(puzzle_completo_somar == 2){
				saidas_mapa_1 = verdadeiro
			}
		}
		se (mapa_3) {
			se(puzzle_completo_somar_2 == 14){
				saidas_mapa_3 = verdadeiro
			}
		}
	}

	funcao animacao_final()
	{
		inteiro vol = 75
		inteiro mapa_final = Graficos.carregar_imagem("imagens/sprites/mapa_final.png")
		Graficos.desenhar_imagem(0, 0, mapa_final)
		Graficos.desenhar_imagem(15*sqm, linha_atual_personagem*sqm - 64, frisk_atual)
		Graficos.renderizar()
		Util.aguarde(500)
		Graficos.desenhar_imagem(0, 0, mapa_final)
		Graficos.desenhar_imagem(15*sqm+sqm/2, (linha_atual_personagem*sqm-64), frisk_direita_2_gameplay)
		Graficos.renderizar()
		Util.aguarde(200)
		Graficos.desenhar_imagem(0, 0, mapa_final)
		Graficos.desenhar_imagem(16*sqm, linha_atual_personagem*sqm- 64, frisk_atual)
		Graficos.renderizar()
		Util.aguarde(300)
		para(inteiro i = 255; i>=0; i--){
		Graficos.desenhar_imagem(0, 0, mapa_final)
		Graficos.desenhar_imagem(16*sqm+sqm/2+1*sqm, (linha_atual_personagem*sqm-64), frisk_direita_2_gameplay)
		Graficos.definir_opacidade(i)
		Graficos.renderizar()
		Util.aguarde(5)
		Sons.definir_volume(vol)
		vol --
		}
		Sons.interromper_som(musica_mapa_gelo)

		Graficos.definir_opacidade(255)
		Util.aguarde(1000)
		
		inteiro som_creditos = Sons.carregar_som("sons/creditos_final2.mp3")
		Sons.definir_volume(80)
		//Sons.reproduzir_som(som_credito_teste, verdadeiro)
		Sons.reproduzir_som(som_creditos, verdadeiro)
		inteiro creditos = Graficos.carregar_imagem("imagens/menu/creditos_fim.png")
		para(inteiro i=0;i<2560;i++){
			Graficos.desenhar_porcao_imagem(0, 0, 0, i, 1024, 640, creditos)
			Graficos.renderizar()
			Util.aguarde(30)
		}
		Util.aguarde(5000)
		Sons.interromper_som(som_creditos)
		Sons.liberar_som(som_creditos)
		Sons.definir_volume(70)
	}
}


/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 96749; 
 * @DOBRAMENTO-CODIGO = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */