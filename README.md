
<!-- README.md is generated from README.Rmd. Please edit that file -->

# help_Guilherme Rossi

## carregando os pacotes necessários

``` r
require(ExpDes.pt)
#> Carregando pacotes exigidos: ExpDes.pt
```

# Anova utilizando o pacote {ExpDes.pt}

``` r
dados <- read.table("data/soybean peroxide_2way.txt", header = TRUE)
head(dados)
#>   Soybean    Water Peroxide
#> 1      Bt     Well 2.41e-06
#> 2      Bt     Well 1.62e-06
#> 3      Bt     Well 1.56e-06
#> 4      Bt     Well 2.39e-06
#> 5      Bt     Well 1.94e-06
#> 6      Bt Deprived 1.02e-06
fator1 <- dados$Soybean
fator2 <- dados$Water
y <- dados$Peroxide

fat2.dic(fator1, fator2, y, quali = c(TRUE, TRUE), mcomp="tukey",
         fac.names = c("Soybean", "Water"))
#> ------------------------------------------------------------------------
#> Legenda:
#> FATOR 1:  Soybean 
#> FATOR 2:  Water 
#> ------------------------------------------------------------------------
#> 
#> 
#> Quadro da analise de variancia
#> ------------------------------------------------------------------------
#>               GL         SQ QM      Fc   Pr>Fc
#> Soybean        1 2.6220e-13  3  0.9607 0.34160
#> Water          1 7.5768e-12  5 27.7603 0.00008
#> Soybean*Water  1 1.4634e-12  2  5.3617 0.03418
#> Residuo       16 4.3670e-12  4                
#> Total         19 1.3669e-11  1                
#> ------------------------------------------------------------------------
#> CV = 29.79 %
#> 
#> ------------------------------------------------------------------------
#> Teste de normalidade dos residuos (Shapiro-Wilk)
#> valor-p:  0.3375591 
#> De acordo com o teste de Shapiro-Wilk a 5% de significancia, os residuos podem ser considerados normais.
#> ------------------------------------------------------------------------
#> 
#> 
#> 
#> Interacao significativa: desdobrando a interacao
#> ------------------------------------------------------------------------
#> 
#> Desdobrando  Soybean  dentro de cada nivel de  Water 
#> ------------------------------------------------------------------------
#> ------------------------------------------------------------------------
#> Quadro da analise de variancia
#> ------------------------------------------------------------------------
#>                        GL SQ QM      Fc  Pr.Fc
#> Water                   1  0  0 27.7603  1e-04
#> Soybean:Water Deprived  1  0  0  0.8916 0.3591
#> Soybean:Water Well      1  0  0  5.4307 0.0332
#> Residuo                16  0  0               
#> Total                  19  0  0               
#> ------------------------------------------------------------------------
#> 
#> 
#> 
#>  Soybean  dentro do nivel  Deprived  de  Water 
#> 
#> De acordo com o teste F, as medias desse fator sao estatisticamente iguais.
#> ------------------------------------------------------------------------
#>   Niveis    Medias
#> 1     Bt 1.294e-06
#> 2    nBt 9.820e-07
#> ------------------------------------------------------------------------
#> 
#> 
#>  Soybean  dentro do nivel  Well  de  Water 
#> ------------------------------------------------------------------------
#> Teste de Tukey
#> ------------------------------------------------------------------------
#> Grupos Tratamentos Medias
#> a     nBt     2.754e-06 
#>  b    Bt      1.984e-06 
#> ------------------------------------------------------------------------
#> 
#> 
#> 
#> Desdobrando  Water  dentro de cada nivel de  Soybean 
#> ------------------------------------------------------------------------
#> ------------------------------------------------------------------------
#> Quadro da analise de variancia
#> ------------------------------------------------------------------------
#>                   GL SQ QM      Fc  Pr.Fc
#> Soybean            1  0  0  0.9607 0.3416
#> Water:Soybean Bt   1  0  0  4.3609 0.0531
#> Water:Soybean nBt  1  0  0 28.7611  1e-04
#> Residuo           16  0  0               
#> Total             19  0  0               
#> ------------------------------------------------------------------------
#> 
#> 
#> 
#>  Water  dentro do nivel  Bt  de  Soybean 
#> 
#> De acordo com o teste F, as medias desse fator sao estatisticamente iguais.
#> ------------------------------------------------------------------------
#>     Niveis    Medias
#> 1 Deprived 1.294e-06
#> 2     Well 1.984e-06
#> ------------------------------------------------------------------------
#> 
#> 
#>  Water  dentro do nivel  nBt  de  Soybean 
#> ------------------------------------------------------------------------
#> Teste de Tukey
#> ------------------------------------------------------------------------
#> Grupos Tratamentos Medias
#> a     Well    2.754e-06 
#>  b    Deprived    9.82e-07 
#> ------------------------------------------------------------------------
```
