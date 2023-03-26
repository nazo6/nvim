return {
  lrequire = function(mod)
    return require("user.config.heirline." .. mod)
  end,
  -- weztermでは半角だがwindows terminalでは全角で表示される記号がある
  -- 実際には両方で半角文字として認識されているがwindows terminalでは無理やり表示(はみ出す)、weztermでは半角に縮小されて表示されていると考えられる
  -- とりあえずwindows terminalに合わせてスペースを追加してある(前方にはみ出す記号があり、cellwidthsでは対処できなかった)
  separators = {
    vertical_bar = "┃",
    vertical_bar_thin = "│",
    left = "",
    right = "",
    block = "█",
    left_filled = "",
    right_filled = "",
    slant_left = "",
    slant_left_thin = "",
    slant_right = "",
    slant_right_thin = " ",
    slant_left_2 = "",
    slant_left_2_thin = " ",
    slant_right_2 = "",
    slant_right_2_thin = " ",
    left_rounded = "",
    left_rounded_thin = "",
    right_rounded = "",
    right_rounded_thin = "",
    circle = "● ",
  },
  colors = require("kanagawa.colors").setup().palette,
}
