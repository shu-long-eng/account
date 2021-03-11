using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            comboBox1.Items.Add("支出");
            comboBox1.Items.Add("收入");
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            monthCalendar1.Hide(); //開啟程式馬上隱藏日曆

            textBox1.ReadOnly = true;

        }

        private void button1_Click(object sender, EventArgs e)
        {
            monthCalendar1.Show(); //按下選擇鍵顯示日曆

        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {
            textBox1.Text = monthCalendar1.SelectionStart.ToShortDateString(); //選擇日期
            monthCalendar1.Hide(); //選擇日期後隱藏日曆
        }

        private void Exit_Click(object sender, EventArgs e)
        {
            System.Environment.Exit(0); //離開程式
        }

        private void Save_Click(object sender, EventArgs e)
        {
            string con, sql;
            con = "Data Source=.\\SQLExpress;Initial Catalog=財經系統;Integrated Security=True"; //連接資料庫

            sql = "insert into moneydata   values ('" + textBox1.Text+"\',"+
                                                    "\'"+comboBox1.Text+"\',"+
                                                          textBox3.Text+","+
                                                      "\'"+textBox4.Text+"\',"+
                                                         "\'"+textBox5.Text+
                                                                                 " ')"; //SQL 語法
            
            SqlConnection mycon = new SqlConnection(con);

            mycon.Open();

            SqlDataAdapter myda = new SqlDataAdapter(sql, con);
            
            DataSet myds = new DataSet();

            if (textBox1.Text == "") { MessageBox.Show("日期不能為空"); }
            else if (comboBox1.Text == "") { MessageBox.Show("請選擇收入/支出"); }
            else if (textBox3.Text == "") { MessageBox.Show("金額不能為空"); }
            else if (textBox4.Text == "") { MessageBox.Show("用途不能為空"); }
            //else if (textBox5.Text == "") { MessageBox.Show("用途不能為空"); }
            else
            {
                myda.Fill(myds, "財經系統");
                
                mycon.Close();
                MessageBox.Show("儲存完畢");
                System.Environment.Exit(0); //離開程式
            }

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
           
        }

       private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (((int)e.KeyChar < 48 | (int)e.KeyChar > 57) & (int)e.KeyChar != 8) //KeyChar字碼內48-57為數字 8為倒退鍵
            {
                e.Handled = true; //跳過處理
            }
        }
    }
}
