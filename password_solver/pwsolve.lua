local word_tree = {
    ["n"] = {
        ["e"] = {
            ["v"] = {
                ["e"] = {
                    ["r"] = "never"
                }
            }
        }
    },
    ["o"] = {
        ["t"] = {
            ["h"] = {
                ["e"] = {
                    ["r"] = "other"
                }
            }
        }
    },
    ["p"] = {
        ["o"] = {
            ["i"] = {
                ["n"] = {
                    ["t"] = "point"
                }
            }
        },
        ["l"] = {
            ["a"] = {
                ["c"] = {
                    ["e"] = "place"
                },
                ["n"] = {
                    ["t"] = "plant"
                }
            }
        }
    },
    ["w"] = {
        ["a"] = {
            ["t"] = {
                ["e"] = {
                    ["r"] = "water"
                }
            }
        },
        ["r"] = {
            ["i"] = {
                ["t"] = {
                    ["e"] = "write"
                }
            }
        },
        ["o"] = {
            ["u"] = {
                ["l"] = {
                    ["d"] = "would"
                }
            },
            ["r"] = {
                ["l"] = {
                    ["d"] = "world"
                }
            }
        },
        ["h"] = {
            ["e"] = {
                ["r"] = {
                    ["e"] = "where"
                }
            },
            ["i"] = {
                ["c"] = {
                    ["h"] = "which"
                }
            }
        }
    },
    ["r"] = {
        ["i"] = {
            ["g"] = {
                ["h"] = {
                    ["t"] = "right"
                }
            }
        }
    },
    ["s"] = {
        ["m"] = {
            ["a"] = {
                ["l"] = {
                    ["l"] = "small"
                }
            }
        },
        ["t"] = {
            ["i"] = {
                ["l"] = {
                    ["l"] = "still"
                }
            },
            ["u"] = {
                ["d"] = {
                    ["y"] = "study"
                }
            }
        },
        ["o"] = {
            ["u"] = {
                ["n"] = {
                    ["d"] = "sound"
                }
            }
        },
        ["p"] = {
            ["e"] = {
                ["l"] = {
                    ["l"] ="spell"
                }
            }
        }
    },
    ["l"] = {
        ["a"] = {
            ["r"] = {
                ["g"] = {
                    ["e"] = "large"
                }
            }
        },
        ["e"] = {
            ["a"] = {
                ["r"] = {
                    ["n"] = "learn"
                }
            }
        }
    },
    ["e"] = {
        ["v"] = {
            ["e"] = {
                ["r"] = {
                    ["y"] = "every"
                }
            }
        }
    },
    ["f"] = {
        ["i"] = {
            ["r"] = {
                ["s"] = {
                    ["t"] = "first"
                }
            }
        },
        ["o"] = {
            ["u"] = {
                ["n"] = {
                    ["d"] = "found"
                }
            }
        }
    },
    ["g"] = {
        ["r"] = {
            ["e"] = {
                ["a"] = {
                    ["t"] = "great"
                }
            }
        }
    },
    ["h"] = {
        ["o"] = {
            ["u"] = {
                ["s"] = {
                    ["e"] = "house"
                }
            }
        }
    },
    ["a"] = {
        ["b"] = {
            ["o"] = {
                ["u"] = {
                    ["t"] = "about"
                }
            }
        },
        ["g"] = {
            ["a"] = {
                ["i"] = {
                    ["n"] = "again"
                }
            }
        },
        ["f"] = {
            ["t"] = {
                ["e"] = {
                    ["r"] = "after"
                }
            }
        }
    },
    ["b"] = {
        ["e"] = {
            ["l"] = {
                ["o"] = {
                    ["w"] = "below"
                }
            }
        }
    },
    ["c"] = {
        ["o"] = {
            ["u"] = {
                ["l"] = {
                    ["d"] = "could"
                }
            }
        }
    },
    ["t"] = {
        ["h"] = {
            ["i"] = {
                ["n"] = {
                    ["g"] = "thing",
                    ["k"] = "think"
                }
            },
            ["r"] = {
                ["e"] = {
                    ["e"] = "three"
                }
            },
            ["e"] = {
                ["i"] = {
                    ["r"]= "their"
                },
                ["r"] = {
                    ["e"] = "there"
                },
                ["s"] = {
                    ["e"] = "these"
                }
            }
        }
    }
}

local inputs = {}

inputs[1] = arg[1] or ""
inputs[2] = arg[2] or ""
inputs[3] = arg[3] or ""
inputs[4] = arg[4] or ""
inputs[5] = arg[5] or "abcdefghijklmnopqrstuvwxyz"


print("Pos 1: " .. inputs[1])
print("Pos 2: " .. inputs[2])
print("Pos 3: " .. inputs[3])
print("Pos 4: " .. inputs[4])
print("Pos 5: " .. inputs[5])

-- local inputs = {
--     "KXABHE",
--     "VBQFNX",
--     "FTYBED",
--     "GRUE",
--     "HLTR"
-- }
local depth = 1

local function solve(input, solution)
--print("Tiefe: " .. depth)
    depth = depth + 1
    for i = 1, #input do
        local char = input:lower():sub(i, i)
--print("Zeichen: " .. char)

        if ( solution[char] ~= nil ) then
--print("Zeichen vorhanden...")
            if (type(solution[char]) == "string") then
--print("Lösung gefunden")
                return solution[char]
            else
--print("Nächste Ebene")
                local word = solve(inputs[depth], solution[char])
                if ( word ~= nil ) then
                    return word
                end
            end
        end
    end
--print("Vorherige Ebene")
        depth = depth - 1
end

print(solve(inputs[depth], word_tree))

--[[

Für jede Möglichkeit an Stelle 1
    Gibt es einen Wert mit dem aktuellen char als Schlüssel?
        Für jede Möglichkeit an Stelle 2
            Gibt es einen Wert mit dem aktuellen char als Schlüssel?
                [...]
            Sonst



]]
