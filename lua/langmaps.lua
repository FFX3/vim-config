-- keys
COLMAKDH =  'colmakdh'
QWERTY =  'qwerty'

-- chosen setting
LANGMAP_SETTING = COLMAKDH

local langmaps = {
    [QWERTY] = '',
    [COLMAKDH] = [[qq,ww,fe,pr,bt,jy,lu,ui,yo,\\;p,aa,rs,sd,tf,gg,mh,nj,ek,il,o\\;,zz,xx,cc,dv,vb,kn,hm,QQ,WW,FE,PR,BT,JY,LU,UI,YO,:P,AA,RS,SD,TF,GG,MH,NJ,EK,IL,O:,ZZ,XX,CC,DV,VB,KN,HM]],
}

vim.cmd([[set langmap=]] .. langmaps[LANGMAP_SETTING])
