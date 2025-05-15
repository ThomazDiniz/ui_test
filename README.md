# UI Inventory

Este projeto implementa um sistema de inventário para o GameMaker como parte de um teste técnico. 
---

## Controles:

- Abrir/fechar inventário com tecla `I`
- Navegação e seleção de itens com o mouse
- Utilização do ítem com a tecla `Enter`

---

Explicação técnica:

Foi desenvolvido uma classe de inventário. Para acesso a estrutura de singleton do inventário ao invés de se utilizar do construtor, decidi por fazer um método de acesso chamado GetInventory(). Esse método é responsável por fazer a criação ou o get do InventoryManager. Decidi por utilizar um objeto único chamado de GameManager para fazer a execução dos códigos.


Tentei utilizar 3 extensões:
  + Input (nunca havia utilizado, aprendi durante esse projeto lendo a [seção newbie guide](https://offalynne.github.io/Input/#/10.0/Newbie-Guide) ) 
  + Scrible importei, mas não tive tempo de utilizar
  + GMLIVE (para facilitar a prototipação do desenho dos menus)


Infelizmente especificamente essa semana eu tenho defesa de qualificação do meu mestrado e aulas extras. Imaginei que quinta-feira eu poderia focar apenas nisso, mas uma aula foi remarcada para quinta.
No fim das contas tirei o pouco de tempo que havia hoje para focar nessa atividade. Isso impossibilitou que eu fizesse esse teste técnico com mais carinho. Decidi por fazer apenas o mínimo para demonstrar que consigo fazer funcionar.
