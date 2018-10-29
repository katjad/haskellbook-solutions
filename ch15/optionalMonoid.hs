-- optionalMonoid.hs

module OptionalMonoid (Optional) where 

    import Data.Monoid

    data Optional a = 
          Nada
        | Only a 
        deriving (Eq, Show)


    -- instance Semigroup a => Semigroup (Optional a) where 
    --     Only a <> Only b = Only (a <> b)
    --     Only a <> Nada = Only a
    --     Nada <> Only b = Only b
    --     Nada <> Nada   = Nada
    -- This is necessary for GHC 8.4


--  https://github.com/aelve/microlens/commit/7944e2dd143b272f0c7aab816196f27881b34820
-- (https://stackoverflow.com/questions/31652475/defining-a-new-monad-in-haskell-raises-no-instance-for-applicative)


    instance Monoid a => Monoid (Optional a) where
        mempty = Nada
        mappend (Only a) (Only b) = Only (a `mappend` b)
        mappend (Only a) Nada  = Only a
        mappend Nada (Only b) = Only b 
        mappend Nada Nada = Nada

