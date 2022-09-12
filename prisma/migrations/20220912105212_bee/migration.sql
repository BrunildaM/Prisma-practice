-- CreateTable
CREATE TABLE "Libraries" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Books" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "librariesId" INTEGER NOT NULL,
    CONSTRAINT "Books_librariesId_fkey" FOREIGN KEY ("librariesId") REFERENCES "Libraries" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
