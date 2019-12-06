module Main exposing (..)

import Browser
import Html exposing (Html, button, div, h1, input, text)
import Html.Attributes exposing (type_)
import Html.Events exposing (onClick, onInput)



---- MODEL ----


type alias Model =
    { title : String
    , counter : Int
    }


init : ( Model, Cmd Msg )
init =
    ( { title = "Welcome", counter = 0 }, Cmd.none )



---- UPDATE ----


type Msg
    = UpdateModel String
    | IncrementCounter


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        IncrementCounter ->
            ( { model | counter = model.counter + 1 }, Cmd.none )

        UpdateModel str ->
            ( { model | title = str }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.title ]
        , input [ type_ "text", onInput UpdateModel ] []
        , div [] [ text (String.fromInt model.counter) ]
        , button [ onClick IncrementCounter ] [ text "ADD" ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
