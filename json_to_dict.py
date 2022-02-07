import json
movie = '{"Action" : "Die Hard ", "Comedy" : "Chupke Chupke", "Action_comedy" : ["A","B","C","D"], "Romance" : {"1": "a", "2": "b", "3": "c", "4": "d"}}'

movie_dict = json.loads(movie)

print(type(movie_dict))
print(movie_dict)

print("\nDict to json")

movie_json = json.dumps(movie_dict)

print(type(movie_json))
print(movie_json)

