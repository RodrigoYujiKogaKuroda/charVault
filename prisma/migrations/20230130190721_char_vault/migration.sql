-- CreateTable
CREATE TABLE "Races" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Races_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Backgrounds" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Backgrounds_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Classes" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Classes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subclasses" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "class_id" INTEGER NOT NULL,

    CONSTRAINT "Subclasses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Characters" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "level" INTEGER NOT NULL,
    "race_id" INTEGER NOT NULL,
    "subclass_id" INTEGER NOT NULL,
    "background_id" INTEGER NOT NULL,

    CONSTRAINT "Characters_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Races_name_key" ON "Races"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Backgrounds_name_key" ON "Backgrounds"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Classes_name_key" ON "Classes"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Subclasses_name_key" ON "Subclasses"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Subclasses_class_id_key" ON "Subclasses"("class_id");

-- CreateIndex
CREATE UNIQUE INDEX "Characters_name_key" ON "Characters"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Characters_race_id_key" ON "Characters"("race_id");

-- CreateIndex
CREATE UNIQUE INDEX "Characters_subclass_id_key" ON "Characters"("subclass_id");

-- CreateIndex
CREATE UNIQUE INDEX "Characters_background_id_key" ON "Characters"("background_id");

-- AddForeignKey
ALTER TABLE "Subclasses" ADD CONSTRAINT "Subclasses_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "Classes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Characters" ADD CONSTRAINT "Characters_race_id_fkey" FOREIGN KEY ("race_id") REFERENCES "Races"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Characters" ADD CONSTRAINT "Characters_subclass_id_fkey" FOREIGN KEY ("subclass_id") REFERENCES "Subclasses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Characters" ADD CONSTRAINT "Characters_background_id_fkey" FOREIGN KEY ("background_id") REFERENCES "Backgrounds"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
