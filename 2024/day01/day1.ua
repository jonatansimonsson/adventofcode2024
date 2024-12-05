Test ← (
  $ 3 4
  $ 4 3
  $ 2 5
  $ 1 3
  $ 3 9
  $ 3 3
)

Inp   ← ⊜(⊜⋕⊸≠@ )⊸≠@\n ⍣&fras Test "input.txt"
Part₁ ← /+≡⌵≡/-⍉≡⍆⍉
Part₂ ← /+×⊃(≡/+⊞=°⊟|⊢)⍉
⊃(Part₂|Part₁)Inp