# Desafio - iOS

Este projeto é a resolução para o desafio proposto pela empresa ### para posição de DEV IOS Sr.

## O que é o Desafio ?

O desafio consiste em desenvolver um aplicativo iOS em Swift (ou Objective-C). Deve-se consumir uma API pública do Rick & Morty.

### Requisitos obrigatórios: 

- Tela de listagem de personagens (com paginação)
- Tela de detalhes do personagem
- Filtro de personagens
- Escrever testes unitários e de UI
- Suporte ao modo offline (cachear localmente response da API)
- Suporte a rotação de tela (orientações portrait e landscape)

## Configurações do ambiente e do Projeto

- Versão XCode: **14.3.1**
- Versão Mac OS: **Ventura 13.4.1** 
- Versão mínima iOS: **14.0**
- Gerenciador de Pacotes: **CocoaPods 1.12.1**
- Ruby: **2.6.10p210**

### Bibliotecas externas utilizadas

- Alamofire: **5.7.1**
- Mocker: **2.5.5**

## Desenvolvimento do Projeto

O projeto foi desenvolvido seguindo o padrão MVVM e as interfaces foram criadas utilizando ViewCode. Esse padrões foram escolhidos por serem de maior praticidade para o desenvolvedor.

Para a comunicação com a API foi optado pela utilização do *Alamofire*, e criado o interceptor *CustomRequestInterceptor*, nele fica a configuração do *Session* e a implementação do *adapt* e *retrier*. Métodos esses que estão atualmente com a configuração mais simples possível, mas que podem facilmente serem alterados para acrescentar algum cabeçalho a reuisição, e tratar a necessidade ou não de ser refeita a requisição.

### Tela de Listagem de Personagens (com paginação)

Não ficou entendido ao certo o que 'paginação' exigia. Foi percebido que o endpoint */character* retorna uma lista sempre separada por paginas, portanto a seguinte logica foi aplicada para consumir todas as 'paginas' do endpoint

```
if let pageAmount = characterResponse.getInformationResponse()?.getPageAmount() {
    if page < pageAmount {
        page += 1
        characterFilter.setPage(page: String(page))
        self.getCharacterList(characterFilter: characterFilter)
        
    } else {
        self.refreshControl.endRefreshing()
        self.characterListView.tableView.reloadData()
    }
}
```

A segunda interpretação foi que a tela da listagem deveria ter 'paginas', e, de alguma maneira ao chegar ao final da primeira lista o usuário deveria interagir para que as demais fossem carregadas. Essa segunda interpretação não foi implementada no projeto.

### Tela de detalhes do personagem

Ao clicar sobre um personagem da *Lista*, é redirecionado para a tela de *Detalhes*. Entende-se que esse requisito foi plenamente atendido.

### Filtro de personagens

Na tela de *listagem* dos personagens há um botão *Filter*, posicionado na direita da *Barra de navegação*, onde o usuário pode digitar o *NOME* que deseja filtrar e selecionar uma opção entre *alive* *dead* *unknown*, após isso clicando em *Filter* será retornado para a listagem de personagem com o retorno do filtro realizado pelo o usuário. 

Na tela de *listagem* já filtrada há um botão *Cancel* posicionado na esquerda da *Barra de navegação*, ao clicar a lista completa é exibida novamente. Entende-se que esse requisito foi plenamente atendido.

### Escrever testes unitários e de UI

Em relação ao UITest, foi criado três testes de navegação, um para testar a troca entre as telas de listagem de personagens, detalhes e filtro, e outros dois para testar a navegação e execução dos filtros.

Em relação a Unit Test, foi criado testes para a *Service* responsável pela montagem da requisição, e outros dois testes para cada *ViewModel*. 

OBS: o teste unitário da *Service* possui um erro após a execução com sucesso do teste, ocorre um crash com a **Session**, que não foi concertado até o presente momento.

### Suporte ao modo offline (cachear localmente response da API)

Foi optado por utilizar o cache com o *Alamofire* executando a seguinte configuração (abaixo) no *URLSessionConfiguration* passado como parametro na criação do *Session* 

```
configuration.requestCachePolicy = .returnCacheDataElseLoad

let responseCacher = ResponseCacher(behavior: .modify { _ , response in
  let userInfo = ["date": Date()]
    
  return CachedURLResponse(
    response: response.response,
    data: response.data,
    userInfo: userInfo,
    storagePolicy: .allowed)
})
```

Outra possibilidade pensada: codificar a resposta do */character* usando *JSONEncode* e salvar o *Data* no *UserDefaults*, porém isso traria complicações para armazenar as respostas de cada filtro, portanto foi optado pela opção do cache do *Alamofire*

OBS: Quando o dispositivo está offline nenhunha imagem é exibida, uma opção paliativa seria criar uma imagem "padrão" para aparecer quando não houver imagem, e uma solução definitiva seria cachear o "get" de cada imagem, porém essas opções não foram desenvolvidas.

### Suporte a rotação de tela (orientações portrait e landscape)

Aplicativo não suporta apenas o modo *Cabeça para baixo*. Entende-se que esse requisito foi plenamente atendido.


## Pontos ainda a serem implementados
- teste unitario

## Observações
Para exibir erros foi utilizado a classe *Toast* criada pela comunidade. Não sendo a melhor forma de exibir um erro ao usuário
