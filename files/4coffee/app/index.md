## Bem vindo a cafeteria _4coffee_




**Sou uma api construída em Flask!**



---

Se liga neste guia:

- Para adicionar um pedido:


`POST /add_coffee`
```json

{
	"coffee": "espresso",
	"price": 11.00,
	"sugar": false,
	"customer": "Thay"
}

```

- Para consultar todos os indices:

`GET /coffee/all`