defmodule BullsAndCows do
  def score_guess(secret, guess) do
    secret_list = String.graphemes(secret)
    guess_list  = String.graphemes(guess)

    bulls =
      Enum.zip(secret_list, guess_list)
      |> Enum.count(fn {s, g} -> s == g end)

    total_matches = total_matches(secret_list, guess_list)
    cows = total_matches - bulls

    if bulls == 4 do
      "You win"
    else
      "#{bulls} Bulls, #{cows} Cows"
    end
  end

  defp frequencies(list) do
    Enum.reduce(list, %{}, fn digit, acc ->
      Map.update(acc, digit, 1, &(&1 + 1))
    end)
  end

  defp total_matches(secret_list, guess_list) do
    freq_secret = frequencies(secret_list)
    freq_guess  = frequencies(guess_list)

    Map.keys(freq_secret)
    |> Enum.reduce(0, fn digit, acc ->
      acc + min(Map.get(freq_secret, digit, 0), Map.get(freq_guess, digit, 0))
    end)
  end
end
