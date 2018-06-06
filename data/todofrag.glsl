#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

varying vec4 vertColor;
varying vec3 cameraDirection;
varying vec3 lightDirectionReflected;
varying vec3 ecNormal;
varying vec3 lightDir;
varying vec4 vertTexCoord;
varying vec3 lightColorv;

void main() {

  float ambientStrength = 0.1;
  vec3 ambient = ambientStrength * lightColorv;
  vec3 result = ambient * vec3(vertColor);

  vec3 direction = normalize(lightDir);
  vec3 normal = normalize(ecNormal);
  vec3 direction_r = normalize(lightDirectionReflected);
  vec3 camera = normalize(cameraDirection);
  float intensity = max(0.0, dot(direction, camera)+dot(direction_r, camera)+dot(result, camera));
  vec4 tintColor = vec4(intensity, intensity, intensity, 1) * vertColor;
  gl_FragColor = texture2D(texture, vertTexCoord.st) * tintColor;
}