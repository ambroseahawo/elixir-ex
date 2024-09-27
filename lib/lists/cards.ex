defmodule Lists.Cards do
  alias Lists.Cards

  @moduledoc """
  This module provides methods for creating and handling a deck of cards.
  """

  @doc """
    Returns a list of strings representing a deck of playing cards.
  """
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King"
    ]

    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # match values to suits
    # list comprehension
    # for loop in elixir

    # solution one
    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end

    # List.flatten(cards)

    # solution two
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  # the number of arguments that a function accepts is known as arity
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand.


  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  # Cards.deal(deck, 5) { *hand*, *deck* }
  # { hand, rest_of_deck } = { *hand*, *rest_of_deck* }
  def pattern_matching do
    color1 = ["red"]
    "Color 1: #{color1}"

    [color1] = ["red"]
    "Color 1: #{color1}"

    [color1, color2] = ["red", "blue"]
    "Color 1: #{color1}, Color 2: #{color2}"
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # method one
    # {status, binary} = File.read(filename)

    # avoid if statements in elixir,
    # use case instead
    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "This file does not exist"
    # end

    # method two
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "This file does not exist"
    end
  end

  def create_hand(hand_size) do
    # when using pipe operator, we do not need to do any assignment to a temporary variable.
    # the result of each function is automatically sent to the next function in the chain
    # the pipe operator demands the methods to take consistent first arguments to work properly.
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end

  # maps, keyword lists
end
