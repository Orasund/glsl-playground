#extension GL_OES_standard_derivatives:enable

precision highp float;

uniform float u_time;
uniform vec2 u_mouse;
uniform vec2 u_resolution;

vec2 relative(vec2 pos){
    return pos/min(u_resolution.x,u_resolution.y);
}

float pow2(float v){
    return v*v;
}

void main(){
    vec2 st=relative(gl_FragCoord.xy);
    vec2 mouse=relative(u_mouse);
    
    vec2 center=relative(u_resolution/2.)+mouse/16.-1./32.;
    float shape=abs(pow2(length(st-center))-.125);
    
    vec4 backgroundColor=vec4(st.x,st.y,.5,1.);
    vec4 shapeColor=vec4(0.,st.y,0.,1.);
    gl_FragColor=
    backgroundColor*(1.125+sin(u_time)*shape*8.);
    
}
