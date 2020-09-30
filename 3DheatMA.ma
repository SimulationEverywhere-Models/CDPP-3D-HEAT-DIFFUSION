[top]
components : surface genHeat@Generator genCold@Generator
link : out@genHeat inputHeat@surface
link : out@genCold  inputCold@surface

[surface]
type : cell
dim : (4, 4, 4)
delay : transport
defaultDelayTime  : 100
border : wrapped 
neighbors :                      surface(-1,0,-1)
neighbors : surface(0,-1,-1)  surface(0,0,-1)  surface(0,1,-1)
neighbors :                      surface(1,0,-1)
neighbors : surface(-1,-1,0)  surface(-1,0,0)  surface(-1,1,0) 
neighbors : surface(0,-1,0)   surface(0,0,0)   surface(0,1,0)
neighbors : surface(1,-1,0)   surface(1,0,0)   surface(1,1,0)
neighbors :                      surface(-1,0,1)
neighbors : surface(0,-1,1)   surface(0,0,1)   surface(0,1,1)
neighbors :                      surface(1,0,1)
neighbors : surface(0,0,-2) surface(0,0,2) surface(0,2,0)
neighbors : surface(0,-2,0) surface(2,0,0) surface(-2,0,0)
initialvalue : 24
in : inputHeat inputCold
link : inputHeat in@surface(3,3,0)
link : inputHeat in@surface(2,2,1)
link : inputCold  in@surface(3,3,2)
link : inputCold  in@surface(1,3,3)
localtransition : calor-rule
portInTransition : in@surface(3,3,0)  setHeat
portInTransition : in@surface(2,2,1)  setHeat
portInTransition : in@surface(3,3,2)  setCold
portInTransition : in@surface(1,3,3)  setCold

[calor-rule]
rule : { ( (-1,0,-1) + (0,-1,-1) + (0,0,-1) + (0,1,-1) + (1,0,-1) + (-1,-1,0) +
           (-1,0,0) + (-1,1,0)  + (0,-1,0) + (0,0,0) + (0,1,0) + (1,-1,0) +
           (1,0,0) + (1,1,0) + (-1,0,1) + (0,-1,1) + (0,0,1) + (0,1,1) + (1,0,1)
           + (0,0,-2) + (0,0,2) + (0,2,0) + (0,-2,0) + (2,0,0) + (-2,0,0) ) / 25 } 1000 { t }

[setHeat]
rule : { uniform(24,80) } 1000 { t }

[setCold]
rule : { uniform(-45,10) } 1000 { t }

[genHeat]
distribution : exponential
mean : 40
initial : 1
increment : 0

[genCold]
distribution : exponential
mean : 40
initial : 1
increment : 0
