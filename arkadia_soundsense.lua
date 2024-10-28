arkadia_soundsense = arkadia_soundsense or {}

arkadia_soundsense.soundtable = {
    ["walka"] = {
        ["zadane"] = {
            ["cios"] = "sounds/walka_zadane_1.mp3",
            ["finish"] = "sounds/walka_zadane_2.mp3",
        },
        ["uniki"] = {
            ["unik"] = "sounds/walka_uniki_1.mp3",
            ["pudlo"] = "sounds/walka_uniki_2.mp3",
        },
        ["parowanie"] = {
            ["bron"] = "sounds/walka_parowanie_1.mp3",
            ["zbroja"] = "sounds/walka_parowanie_2.mp3",
            ["tarcza"] = "sounds/walka_parowanie_3.mp3",
        }
    },
    ["env"] = {
        ["deszcz"] = "sounds/deszcz.mp3",
        ["burza"] = "sounds/burza.mp3",
        ["wiatr"] = "sounds/wiatr.mp3",
    }
}

local sound_map = {
    ["ledwo muskasz"] = arkadia_soundsense.soundtable["walka"]["zadane"]["1"],
    ["uuu wieje wiatr"] = arkadia_soundsense.soundtable["env"]["wiatr"]
}

function arkadia_soundsense.play_sound(sound)
    if not sound then
        return
    end
    playSoundFileplaySoundFile(
        sound -- name
        , 75 -- volume
        , nil -- fadein
        , nil -- fadeout
        , nil -- start
        , 25 -- priority
        , "https://raw.githubusercontent.com/StickMUD/StickMUDSounds/master/sounds/" -- url
        , nil -- finish
    )
end

function trigger_func_skrypty_ui_gags_color_color_moje_parowanie_ja_paruje()
    scripts.gags:gag_prefix("par", "moje_parowanie")
    arkadia_soundsense.play_sound(arkadia_soundsense.soundtable["walka"]["parowanie"]["bron"])
end

function trigger_func_skrypty_ui_gags_color_color_moje_parowanie_ja_zbroja_paruje()
    scripts.gags:gag_prefix("zbr", "moje_parowanie")
    arkadia_soundsense.play_sound(arkadia_soundsense.soundtable["walka"]["parowanie"]["zbroja"])
end

function trigger_func_skrypty_ui_gags_color_color_moje_parowanie_ja_tarcza_paruje()
    scripts.gags:gag_prefix("tar", "moje_parowanie")
    arkadia_soundsense.play_sound(arkadia_soundsense.soundtable["walka"]["parowanie"]["tarcza"])
end

function trigger_func_skrypty_ui_gags_color_color_moje_parowanie_baron_tarcza2()
    scripts.gags:gag_prefix("TARCZA SPEC", "moje_parowanie")
    arkadia_soundsense.play_sound(arkadia_soundsense.soundtable["walka"]["parowanie"]["tarcza"])
end

function trigger_func_skrypty_ui_gags_color_color_moje_parowanie_ja_paruje_lewak()
    scripts.gags:gag_prefix("par", "moje_parowanie")
    arkadia_soundsense.play_sound(arkadia_soundsense.soundtable["walka"]["parowanie"]["bron"])

end

function trigger_func_skrypty_ui_gags_color_color_moje_uniki_ja_unikasz_ciosu()
    scripts.gags:gag_prefix("unk", "moje_uniki")
    arkadia_soundsense.play_sound(arkadia_soundsense.soundtable["walka"]["uniki"]["unik"])
end

function trigger_func_skrypty_ui_gags_color_color_moje_uniki_ja_ktos_nie_trafia()
    scripts.gags:gag_prefix("unk", "moje_uniki")
    arkadia_soundsense.play_sound(arkadia_soundsense.soundtable["walka"]["uniki"]["pudlo"])
end

function trigger_func_skrypty_ui_gags_color_moje_ciosy(value)
    local ignore_list = {
        "opalizujacego runicznego",
        "czarnoblekitnego pulsujacego morgensterna",
	"czarnego smuklego topora",
    }

    for _, v in pairs(ignore_list) do
        if line:match(v) then
            return
        end
    end

    if rex.match(line, "srebrzyst\\w+ kos\\w+ bojow\\w+") then
        return
    end
    selectString(matches[1], 1)
    setFgColor(45, 185, 45)
    resetFormat()

    scripts.gags:gag(value, 6, "moje_ciosy")
    arkadia_soundsense.play_sound(arkadia_soundsense.soundtable["walka"]["zadane"]["cios"])
end

function trigger_func_skrypty_ui_gags_moje_ciosy_bron_fin()
    scripts.gags:gag_prefix(scripts.gags.fin_prefix, "moje_ciosy")
    arkadia_soundsense.play_sound(arkadia_soundsense.soundtable["walka"]["zadane"]["finish"])
end

function trigger_func_skrypty_ui_gags_moje_ciosy_opal_spec(value)
    scripts.gags:gag(value, 5, "moje_ciosy")
    arkadia_soundsense.play_sound(arkadia_soundsense.soundtable["walka"]["zadane"]["cios"])
end

function trigger_func_skrypty_ui_gags_moje_ciosy_opal(value)
    scripts.gags:gag(value, 7, "moje_ciosy")
    arkadia_soundsense.play_sound(arkadia_soundsense.soundtable["walka"]["zadane"]["cios"])
end

function trigger_func_skrypty_ui_gags_moje_ciosy_opal_fin(value)
    scripts.gags:gag_prefix(scripts.gags.fin_prefix, "moje_ciosy")
    arkadia_soundsense.play_sound(arkadia_soundsense.soundtable["walka"]["zadane"]["finish"])
end