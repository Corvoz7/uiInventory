### objCamera

- Responsável por configurar a câmera para facilitar o desenho do inventário no `Draw GUI`
- Sempre ao abrir o jogo, muda a posição da câmera
- Define o cursor do jogo

### objInventoryManager

- Gerencia o inventário no geral

- Create Event
	- Define variável de controle `keyInventory`
	- Define fonte padrão
	- Criação de estruturas nine-slice para três tipos de caixas (fundo, destaque, informações)
	- Adiciona itens ao inventário com a função `BaseItem`
- Draw GUI Event
	- Exibir/ocultar o inventário ao pressionar "I" (i)
	- Desenhar o inventário com base na resolução GUI
	- Destacar slots ao passar o mouse por cima
	- Permitir o uso de itens ao clicar com o botão esquerdo do mouse
	- Mostrar informações do item, como, nome alternativo e preço do item

### 3. **scrGlobals**

- Script de inicialização de variáveis globais e estrutura de inventário

### 4. **scrInventoryFunctions**

- Possui o construtor `BaseItem` para a criação base de novos itens no inventário
- Funções para desenhar caixas com nine-slice (`Draw9SliceBox`) e para desenhar partes de sprites esticadas (`DrawTileStretched`)
