# Possibilities for "context":
# - letter: a or b
# - rule: 43 104 (meaning "obeys to rule 43 AND 104")
# - 43 93 | 35 109 (meaning "obeys to rule 43 AND 93, OR, 35 AND 109")
def translate(dictionary, context)
  if context.match(/\|/)
    return [
      "(",
      context.split(" | ").map { |atom| translate(dictionary, atom) }.join("|"),
      ")",
    ].join
  end

  # more than one number
  if context.match(/^\d+( \d+)+$/)
    return context.split.map { |atom| translate(dictionary, atom) }.join
  end

  # single number
  if context.match(/^\d+$/)
    return translate(dictionary, dictionary[context])
  end

  # letter
  context
end
