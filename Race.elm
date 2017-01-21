-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/time.html

import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, second)
import Random


main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model =
  { trackWidth : Int
    ,trackHeight : Int
    ,fieldColor1 : String
    ,fieldColor2 : String
    ,fieldWidth : Int
    ,playerHeight : Int
    ,playerWidth : Int
    ,currentTime : Time
    ,orangePosition : Int
    ,redPosition : Int
    ,yellowPosition : Int
    ,greenPosition : Int
    ,bluePosition : Int
    ,indigoPosition : Int
    ,violetPosition : Int
    ,whitePosition : Int
  }


init : (Model, Cmd Msg)
init =
  (Model 300 100 "#573B0C" "#8B5F14" 10 10 10 0 0 0 0 0 0 0 0 0, Cmd.none)

-- UPDATE

type Msg
  = Tick Time
  | NewOrangePosition Int
  | NewRedPosition Int
  | NewYellowPosition Int
  | NewGreenPosition Int
  | NewBluePosition Int
  | NewIndigoPosition Int
  | NewVioletPosition Int
  | NewWhitePosition Int


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime->
      (model, Random.generate NewOrangePosition (Random.int 1 6))

    NewOrangePosition orangeRoll ->
      ({model | orangePosition = model.orangePosition + orangeRoll}, Random.generate NewRedPosition (Random.int 1 6))

    NewRedPosition redRoll ->
      ({model | redPosition = model.redPosition + redRoll}, Random.generate NewYellowPosition (Random.int 1 6))

    NewYellowPosition yellowRoll ->
      ({model | yellowPosition = model.yellowPosition + yellowRoll}, Random.generate NewGreenPosition (Random.int 1 8))

    NewGreenPosition greenRoll ->
      ({model | greenPosition = model.greenPosition + greenRoll}, Random.generate NewBluePosition (Random.int 3 6))

    NewBluePosition blueRoll ->
      ({model | bluePosition = model.bluePosition + blueRoll}, Random.generate NewIndigoPosition (Random.int 0 10))

    NewIndigoPosition indigoRoll ->
      ({model | indigoPosition = model.indigoPosition + indigoRoll}, Random.generate NewVioletPosition (Random.int 5 5))

    NewVioletPosition violetRoll ->
      ({model | violetPosition = model.violetPosition + violetRoll}, Random.generate NewWhitePosition (Random.int -20 20))

    NewWhitePosition whiteRoll ->
      ({model | whitePosition = model.whitePosition + whiteRoll}, Cmd.none)

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every second Tick

-- VIEW


view : Model -> Html Msg
view model =
  let
    trackWidthString = toString model.trackWidth
    trackHeightString = toString model.trackHeight
    fieldWidthString = toString model.fieldWidth
    playerHeightString = toString model.playerHeight
    playerWidthString = toString model.playerWidth
    fieldColor1 = model.fieldColor1
    fieldColor2 = model.fieldColor2
    orangePosition = toString model.orangePosition
    redPosition = toString model.redPosition
    yellowPosition = toString model.yellowPosition
    greenPosition = toString model.greenPosition
    bluePosition = toString model.bluePosition
    indigoPosition = toString model.indigoPosition
    violetPosition = toString model.violetPosition
    whitePosition = toString model.whitePosition
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
        [ fill "black", x "290", y "0", width fieldWidthString, height trackHeightString
        ]
        []
      ,rect
        [ fill "orange", x orangePosition, y "10", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "red", x redPosition, y "20", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "yellow", x yellowPosition, y "30", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "green", x greenPosition, y "40", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "blue", x bluePosition, y "50", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "indigo", x indigoPosition, y "60", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "violet", x violetPosition, y "70", width playerWidthString, height playerHeightString
        ]
        []
      ,rect
        [ fill "white", x whitePosition, y "80", width playerWidthString, height playerHeightString
        ]
        []
    ]
