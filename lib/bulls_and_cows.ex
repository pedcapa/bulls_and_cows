defmodule BullsAndCows do
  def score_guess(secret, guess) do
    secret_list = String.graphemes(secret)
    guess_list  = String.graphemes(guess)

    bulls =
      Enum.zip(secret_list, guess_list)
      |> Enum.count(fn {s, g} -> s == g end)

    "#{bulls} Bulls, 0 Cows"
  end
end
