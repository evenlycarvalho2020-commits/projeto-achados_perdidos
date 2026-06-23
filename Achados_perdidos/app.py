import streamlit as st
import pandas as pd
from datetime import date
from connection import conectar

# conexão
conexao = conectar()
cursor = conexao.cursor()

st.title("📦 Sistema de Achados e Perdidos")

menu = st.sidebar.selectbox(
    "Menu",
    [
        "Cadastrar Item",
        "Listar Itens",
        "Cadastrar Pessoa",
        "Registrar Retirada"
    ]
)
# ================= CADASTRAR ITEM =================

if menu == "Cadastrar Item":

    st.header("📦 Cadastro de Item")

    nome = st.text_input("Nome")
    descricao = st.text_area("Descrição")
    categoria = st.text_input("Categoria")
    local = st.text_input("Local encontrado")
    data = st.date_input("Data", value=date.today())

    if st.button("Salvar"):

        cursor.execute(
            """
            INSERT INTO itens
            (nome, descricao, categoria, local_encontrado, data_encontrado)
            VALUES (%s,%s,%s,%s,%s)
            """,
            (
                nome,
                descricao,
                categoria,
                local,
                data
            )
        )

        conexao.commit()

        st.success("Item salvo com sucesso!")

# ================= LISTAR ITENS =================

elif menu == "Listar Itens":

    st.header("📋 Lista de Itens")

    cursor.execute("""
        SELECT
            id,
            nome,
            descricao,
            categoria,
            local_encontrado,
            data_encontrado
        FROM itens
    """)

    dados = cursor.fetchall()

    if dados:

        df = pd.DataFrame(
            dados,
            columns=[
                "ID",
                "Nome",
                "Descrição",
                "Categoria",
                "Local",
                "Data"
            ]
        )

        st.dataframe(df, use_container_width=True)

    else:
        st.info("Nenhum item cadastrado.")


 # ================= CADASTRAR PESSOA =================

elif menu == "Cadastrar Pessoa":

        st.header("👤 Cadastro de Pessoa")

        nome = st.text_input("Nome")
        turma = st.text_input("Turma")
        funcao = st.text_input("Função")
        telefone = st.text_input("Telefone")
        email = st.text_input("Email")

        if st.button("Salvar Pessoa"):

            if nome == "":
                st.error("Nome é obrigatório")
            else:
                cursor.execute("""
                        INSERT INTO pessoas
                        (nome, turma, funcao, telefone, email)
                        VALUES (%s, %s, %s, %s, %s)
                    """, (
                    nome,
                    turma,
                    funcao,
                    telefone,
                    email
                ))

                conexao.commit()
                st.success("Pessoa cadastrada com sucesso!")

# ================= RETIRADA =================

elif menu == "Registrar Retirada":

    st.header("📤 Registrar Retirada")

    cursor.execute("SELECT id, nome FROM itens")
    itens = cursor.fetchall()

    cursor.execute("SELECT id, nome FROM pessoas")
    pessoas = cursor.fetchall()

    if not itens or not pessoas:
        st.warning("Cadastre itens e pessoas primeiro.")
    else:

        item_dict = {nome: id for id, nome in itens}
        pessoa_dict = {nome: id for id, nome in pessoas}

        item_sel = st.selectbox("Item", list(item_dict.keys()))
        pessoa_sel = st.selectbox("Pessoa", list(pessoa_dict.keys()))

        assinatura = st.text_input("Assinatura")

        if st.button("Registrar"):

            cursor.execute("""
                INSERT INTO retiradas
                (item_id, pessoa_id, data_retirada, assinatura)
                VALUES (%s, %s, %s, %s)
            """, (
                item_dict[item_sel],
                pessoa_dict[pessoa_sel],
                date.today(),
                assinatura
            ))

            conexao.commit()
            st.success("Retirada registrada!")

            st.divider()
            st.subheader("📋 Histórico de Retiradas")

            cursor.execute("""
                SELECT
                    p.nome,
                    p.turma,
                    p.funcao,
                    i.nome,
                    r.data_retirada,
                    r.assinatura
                FROM retiradas r
                JOIN itens i ON r.item_id = i.id
                JOIN pessoas p ON r.pessoa_id = p.id
                ORDER BY r.id DESC
            """)

            dados = cursor.fetchall()

            if dados:

                df = pd.DataFrame(
                    dados,
                    columns=[
                        "Nome",
                        "Turma",
                        "Função",
                        "Item",
                        "Data",
                        "Assinatura"
                    ]
                )

                st.dataframe(df, use_container_width=True)

            else:
                st.info("Nenhuma retirada registrada.")