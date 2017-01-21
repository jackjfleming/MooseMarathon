-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/time.html

import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, second)


main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model = Time


init : (Model, Cmd Msg)
init =
  (0, Cmd.none)

-- UPDATE

type Msg
  = Tick Time


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime ->
      (newTime, Cmd.none)

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every second Tick

-- VIEW

view : Model -> Html Msg
view model =
  let
    trackWidth = 300
    trackHeight = 100
    trackWidthString = toString trackWidth
    trackHeightString = toString trackHeight
    fieldColor1 = "#573B0C"
    fieldColor2 = "#8B5F14"
    fieldWidth = trackWidth/30
    fieldWidthString = toString fieldWidth
    playerHeight = trackHeight/10
    playerHeightString = toString playerHeight
    playerWidth = fieldWidth
    playerWidthString = toString playerWidth
  in

  svg
    [ version "1.1", x "0", y "0", viewBox "0 0 400 400"
    ]
    [ rect
        [ fill fieldColor1, x "0", y "0", width trackWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "0", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "20", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "40", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "60", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "80", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "100", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "120", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "140", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "160", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "180", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "200", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "220", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "240", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "260", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill fieldColor2, x "280", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill "black", x "290", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill "orange", x "10", y "10", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "red", x "10", y "20", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "yellow", x "50", y "30", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "green", x "290", y "40", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "blue", x "90", y "50", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "indigo", x "220", y "60", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "violet", x "280", y "70", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "white", x "150", y "80", width playerWidthString, height playerHeightString
        ]
        []
    ]
