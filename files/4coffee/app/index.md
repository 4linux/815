## Bem vindo a cafeteria _4coffee_


![4coffee](https://media.giphy.com/media/ROyijmazFKRc4/giphy.gif)

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

- Para consultar todos os pedidos:

`GET /coffee/all`


- Para consultar os pedidos de um cliente

`GET /search_customer/<customer>`

- Para consultar os pedidos de uma bebida específica

`GET /search_coffee/<coffee>`