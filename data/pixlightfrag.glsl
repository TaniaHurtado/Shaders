varying vec4 vertColor;
varying vec3 cameraDirection;
varying vec3 lightDirectionReflected;
uniform sampler2D texture;
varying vec4 vertTexCoord;

void main() {
  vec3 direction = normalize(lightDirectionReflected);
  vec3 camera = normalize(cameraDirection);
  float intensity = max(0.0, dot(direction, camera));
  gl_FragColor = texture2D(texture, vertTexCoord.st) * vertColor;
  //gl_FragColor = vec4(intensity, intensity, intensity, 1) * vertColor;
}