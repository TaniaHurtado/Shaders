uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec4 lightPosition;
uniform mat4 texMatrix;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
attribute vec2 texCoord;

varying vec4 vertColor;
varying vec3 cameraDirection;
varying vec3 lightDirectionReflected;
varying vec3 ecNormal;
varying vec3 lightDir;
varying vec4 vertTexCoord;

void main() {
  
  gl_Position = transform * position;    
  vec3 ecPosition = vec3(modelview * position);  
  ecNormal = normalize(normalMatrix * normal);
  lightDir = normalize(lightPosition.xyz - ecPosition);
  cameraDirection = normalize(0 - ecPosition);
  lightDirectionReflected = reflect(-lightDir, ecNormal);
  vertColor = color;
  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);        
}