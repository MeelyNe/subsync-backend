package main

import "github.com/gofiber/fiber/v2"

func main() {
	app := fiber.New()

	app.Get("/", func(c *fiber.Ctx) error {
		return c.JSON(fiber.Map{
			"status": "123",
		})
	})

	app.Get("/p", func(ctx *fiber.Ctx) error {
		return ctx.SendStatus(200)
	})

	app.Listen(":4040")
}
