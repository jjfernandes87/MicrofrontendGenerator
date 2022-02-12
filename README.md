# Introdução 
Template para a criação de SDK iOS. 

Existem duas opções de template: Domínio e Microfrontends.

SDKs de Dominio não é mais recomendado, já que no longo prazo ele pode ser tornar um SDK grande e altamente acoplado entre features, dificultando manutenção, elevando tempo de build e assim diminuindo o Lead time do time.

MicrofrontendSDK é altamente recomendado trazendo benefícios como princípios de inversão de dependência e ferramenta de DI.

### As principais ideias que sustentam os Micro Frontends

- São pequenos, independentes e fracamente acoplados. Uma única equipe pequena de desenvolvedores pode escrever e manter.

- Cada serviço é uma base de código separado, que pode ser gerenciado por uma equipe de desenvolvimento pequena.

- Os serviços podem ser implantados de maneira independente. Uma equipe pode atualizar um serviço existente sem recompilar e reimplantar o aplicativo inteiro.

- Os serviços são responsáveis por manter seus próprios dados ou o estado externo. Isso é diferente do modelo tradicional, em que uma camada de dados separada lida com a persistência de dados.

- Os serviços comunicam-se entre si por meio de deeplinks ou patterns de coordinator bem definidos. Detalhes da implementação interna de cada serviço ficam ocultos de outros serviços.

- Suporte à programação poliglota. Por exemplo, os serviços não precisam compartilhar a mesma pilha de tecnologia, bibliotecas ou estruturas.

# Instalação

- Instalar ou atualizar [brew](https://brew.sh) 
- Instalar ou atualizar [bundler](https://bundler.io)

# Començando
## Para criar SDKDomain
1.	Instalação do rake

```
cd Scripts && ./tools
```

2.	Criação do SDKDomain
```
cd ../ && rake create_domain_sdk [nome_do_dominio]
```

3. Projeto é criado na raiz do repo, a partir daqui, você pode copiar e colocar no seu projeto iOS

## Para criar MicrofrontendSDK
1.	Instalação do rake

```
cd Scripts && ./tools
```

2.	Instalação do ambiente

```
cd ../ && rake install
```

3. Criação do MicrofrontendSDK
```
rake create_microfrontend_sdk
```

4. Responder as perguntas

5. Projeto é criado na raiz do repo, a partir daqui, você pode copiar e colocar no seu projeto iOS

# Throubleshoot
- Em alguns casos será necessário rodar o comando `sudo`
- Caso você tenha problemas com o .gem apontando para a pasta library você pode alterar o profile do mac e adicionar a linha `export GEM_HOME=$HOME/.gem`

# Contribute
- Se você **encontrou um bug**, **tem uma nova feature** ou **quer contribuir**, envie uma pull request.