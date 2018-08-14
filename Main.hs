{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE OverloadedStrings #-}

import Reflex.Dom
import Reflex
import Data.Text (Text, pack)
import Control.Lens

main = mainWidget $
  el "div" $ do
    el "h1" $ text "Welcome to my Reflex App"
    el "p" $ text "My Reflex App is:"
    el "ul" $ do
      el "li" $ text "Cool"
      el "li" $ text "Nice"
      el "li" $ text "Incomprehensible"
    el "p" $ text "Here's a text input that reverses what you type:"
    t <- textInput def
    let inputEvent = (pack . reverse . show) <$> _textInput_input t
    inputDyn <- holdDyn "" inputEvent
    el "p" $ dynText inputDyn
    return ()
