# Modelagem Computacional da Liberação Controlada de Etinilestradiol em Diferentes Matrizes

## Visão Geral do Projeto

Este projeto, desenvolvido como Trabalho de Conclusão de Curso em Engenharia Química na Unicamp, consiste na criação de um modelo computacional em Python para simular e analisar a liberação controlada do fármaco etinilestradiol a partir de três diferentes matrizes: o adesivo transdérmico, o anel vaginal e o contraceptivo oral combinado (COC).

### Motivação

Este projeto foi motivado pela lacuna histórica na pesquisa científica, que por séculos excluiu ou negligenciou as particularidades da saúde feminina. O trabalho busca aplicar as ferramentas da engenharia — especificamente a modelagem computacional — para aprofundar o conhecimento métodos contraceptivos, contribuindo para preencher essa lacuna e incentivar a promoção de melhores condições de saúde para as mulheres.

## Solução Técnica

A complexidade do problema exigiu a aplicação de diferentes modelos matemáticos e métodos numéricos para simular os fenômenos de difusão e dissolução.

* **Modelagem Matemática:**
    * **Adesivo e Anel Vaginal:** A difusão do fármaco foi modelada utilizando a Segunda Lei de Fick, resultando em uma Equação Diferencial Parcial (EDP).
    * **Contraceptivo Oral:** A dissolução foi descrita pela equação de Noyes-Whitney, um modelo de cinética de primeira ordem representado por uma Equação Diferencial Ordinária (EDO).

* **Implementação Computacional:**
    * **Linguagem:** Python
    * **Bibliotecas:** NumPy, SciPy, Matplotlib, Pandas
    * **Métodos Numéricos:**
        * Para as EDPs, foi implementado o **método de Crank-Nicolson**, uma abordagem implícita e incondicionalmente estável, escolhida para superar as limitações computacionais do método de diferenças finitas padrão
        * Para a EDO, foi utilizado o **método de Runge-Kutta de 4ª ordem (RK4)**, garantindo alta precisão na simulação

## Resultados

Os modelos geraram perfis de liberação consistentes com os dados experimentais da literatura, destacando as diferentes características de cada sistema. O gráfico abaixo compara a taxa de liberação simulada ao longo de 21 dias.


<img width="1023" height="525" alt="liberacao_combinada" src="https://github.com/user-attachments/assets/335ab841-e286-46a6-99cf-f609c94d364d" style="padding-top: 20px;" />
