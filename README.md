# Taller Shaders

## Objetivo

Estudiar la clase Shaders y su aplicación en la creación de objetos aplicando diferentes tipos de iluminación y texturas.


## Descripción

En este taller se creo una simulación del sistema solar, en este se tiene una fuente de luz ubicada en la posición del sol y los planetas giran al rededor de este, tomando los efectos de luz de acuerdo a su posición. 

Para agregar los efectos de luz se tuvo en cuenta los tipos de iluminación descritos  en la siguiente imagen:
 <p align="center">
     ![alt-text](data/light.PNG) 
     </p>
     
Para poder apreciar los efectos agregados, es necesario oprimir las teclas numéricas de la siguiente forma:
1: Mostrará solo textura.
2: Mostrará texturas e iluminación ambiente
3: Mostrará texturas e iluminación difusa
4: Mostrará texturas e iluminación espcular
5: Mostrará texturas e iluminación difusa+especular
6: Mostrará texturas y una combinacióon de as iluminaciones ambiente, difusa y especular.

Además de esto, se agregaron algunas efectos de las imágenes para poder apreciar los cambios en colores del sistema
7: Mostrará uuna combinación de los colores de los vertices
8: Mostrará los colores invertidos de los objetos del sistema
9: Mostrará los canales de colores principales de los objetos

## Referencias
Se tomaron archivos glsl para lights y textures como referencia de los tutoriales de la página Shaders de Processing: https://processing.org/tutorials/pshader/

Para profundizar en información de lighting en opengl se tomó información de la página LearnOpenGL: https://learnopengl.com/Lighting/Basic-Lighting


Para el monvimiento de los planetas y la forma del sistema se tomó como referencia el código fuente del siguiente repositorio:
https://github.com/CodingTrain/website/tree/master/CodingChallenges/CC_008_SolarSystemGenerator3D


## Integrantes



| Integrante | github nick |
|------------|-------------|
| Tania Paola Hurtado | TaniaHurtado|

## Resultados

Como resultado se tiene la siguinete animación del sistema solar:
![Alt Text](data/animado.gif)

## Trabajos Futuros
Agregar mas objetos al sistema, satélites y lunas que orbiten alrededor de los planetas, manejando la iluminación adecuada con cada uno de ellos.
