" {W} -> [É]
" ——————————
" On remappe W sur É :
noremap é w
noremap É W
" Corollaire: on remplace les text objects aw, aW, iw et iW
" pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
onoremap aé aw
onoremap aÉ aW
onoremap ié iw
onoremap iÉ iW
" Pour faciliter les manipulations de fenêtres, on utilise {W} comme un Ctrl+W :
noremap w <C-w>
noremap W <C-w><C-w>

" [HJKL] -> {CTSR}
" ————————————————
" {cr} = « gauche / droite »
noremap c h
noremap r l
" {ts} = « haut / bas »
noremap t j
noremap s k
" {TS} = « joindre / aide »
noremap T J
noremap S K
" Corollaire : repli suivant / précédent
noremap zs zj
noremap zt zk

" {HJKL} <- [CTSR]
" ————————————————
" {J} = « Jusqu'à »            (j = suivant, J = précédant)
noremap j t
noremap J T
" {L} = « Change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
noremap l c
noremap L C
" {H} = « Remplace »           (h = un caractère slt, H = reste en « Remplace »)
noremap h r
" {K} = « Su:stitue »          (k = caractère, K = ligne)
noremap k s

" Désambiguation de {g}
" —————————————————————
" ligne écran précédente / suivante (à l'intérieur d'une phrase)
noremap gs gk
noremap gt gj
" onglet précédant / suivant
noremap gb gT
noremap gé gt
" optionnel : {g"} pour aller au début de la ligne écran
noremap g" g0

" <> en direct
" ————————————
noremap « <
noremap » >

" Remaper la gestion des fenêtres
" ———————————————————————————————
" move up
noremap wt <C-w>j  
" move down
noremap ws <C-w>k
" move lef
noremap wc <C-w>h
" move right
noremap wr <C-w>l
" close current window
noremap wd <C-w>c
" close all other windows
noremap wo <C-w>o
" split horizontaly
noremap w<SPACE> :split<CR>
" split verticaly
noremap w<CR> :vsplit<CR>
"Si vous souhaitez avoir les chiffres en accès direct en mode normal, remplacez la section « <> en direct » par les lignes suivantes :

" " Chiffres en accès direct
" " ————————————————————————
" noremap " 1
" noremap 1 "
" noremap « 2
" noremap 2 <
" noremap » 3
" noremap 3 >
" noremap ( 4
" noremap 4 (
" noremap ) 5
" noremap 5 )
" noremap @ 6
" noremap 6 @
" noremap + 7
" noremap 7 +
" noremap - 8
" noremap 8 -
" noremap / 9
" noremap 9 /
" noremap * 0
" noremap 0 *

" NERDtree
let NERDTreeMapOpenInTab='\t'
let NERDTreeMapOpenVSplit='\s'
map <C-n> :NERDTreeToggle<CR>

" Escape
imap ttt <esc>

" Save and escape
noremap <leader>s :w<CR>
inoremap <leader>s <esc>:w<CR>
noremap <leader>z :wq<CR>
