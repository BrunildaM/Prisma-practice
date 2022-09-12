import express from 'express'
import cors from 'cors'

import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient({ log: ['warn', 'error', 'info', 'query'] })
const app = express()
app.use(cors())
app.use(express.json())

const port = 4000

app.get('/books', async (req, res) => {
   const books = await prisma.books.findMany({ include: {libraryId: true}})
   res.send(books)
})

app.get('/libraries', async (req, res) => {
   const libraries = await prisma.libraries.findMany({include: {books: true}})
    res.send(libraries)
})

app.listen(port, () => {
    console.log(`Server on: http://localhost:${port}`)
})