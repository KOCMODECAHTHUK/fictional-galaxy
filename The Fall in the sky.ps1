﻿# Подключаем то, с помощью чего будем рисовать нашу форму
Add-Type -assembly System.Windows.Forms

	# Все просто, массивы из списка серверов, списка пользоватей, и варианты подписи - чтобы использовать могла не только поддержка.
	$Server        = @("Европа", "Азия", "Америка", "Другие")
	$User          = @("*", "UserPC", "Administrator")
	$Message       = "Шаблон заголовка"
	# По хорошему, надо бы сделать так, чтобы если умолчательное сообщение не менялось и шло нажатие на кнопку отправить, то выводилось бы предупреждение.
	# Так же по аналогии с тем что есть, тут тоже можно повесить список со стандартными сообщениями

	# Подписываемся
	$Sign          = @("Сообщение по Умолчанию")

	# Повелось, что все функции описываются до их использования.
	# Функция отправки сообщения. Принимаем параметры, проверяем, если чекбокс включен (а он включен по умолчанию), устанавливаем параметры отправки только на консоль локалхоста, иначе проходим по списку серверов, внутри каждого сервера инициируем цикл по списку пользователей с предварительно отрезанными пробелами до и после текста(помните формат: "сервер1, сервер2, сервер3" для красивой читаемости текста), вызываем сам msg для отправки сообщения и после чего вызываем диалогов окно с подтверждением отправки и закрытием программы.
Function SendMessage {
        param ($Server, $User, $Message, $Sign)
       # Write-Host $Server, $User, $Message, $Sign
        If ($TestRunCheckBox.Checked -eq 1 ) { Write-Host $TestRunCheckBox.Checked; $Server="localhost"; $User = "Console" }
        ForEach ($Item in $Server) {
            ForEach ($UserX in $User) {
                    $UserTrim = $UserX.Trim()
                    $ServerTrim = $Item.Trim()
                    $MsgTrim = $Message.Trim()
                    $SignTrim = $SignX.Trim()
                    # Отладочный вывод, оставлен на всякий случай.
                    # Write-Host "User: $UserTrim; Server: $ServerTrim; Message: $MsgTrim; Signature: $SignTrim"
                    c:\windows\system32\msg.exe $UserTrim /Server:$ServerTrim $MsgTrim $SignTrim
                }
        }
     Confirm
    }

# Вывод окна с подтверждением
Function Confirm {
        $ConfirmWin = New-Object System.Windows.Forms.Form
        $ConfirmWin.StartPosition  = "CenterScreen"
        $ConfirmWin.Text = "Подтверждение отправки"
        $ConfirmWin.Width = 200
        $ConfirmWin.Height = 120
        $ConfirmWin.ControlBox = 0

        $ConfirmWinOKButton = New-Object System.Windows.Forms.Button
        $ConfirmWinOKButton.add_click({ $MainSendWindow.Close(); $ConfirmWin.Close() })
        $ConfirmWinOKButton.Text = "Закрыть"
        $ConfirmWinOKButton.AutoSize = 1
        $ConfirmWinOKButton.Location        = New-Object System.Drawing.Point(50,50)

        $ConfirmLabel = New-Object System.Windows.Forms.Label
        $ConfirmLabel.Text = "Сообщение было отправлено"
        $ConfirmLabel.AutoSize = 1
        $ConfirmLabel.Location  = New-Object System.Drawing.Point(10,10)

        $ConfirmWin.Controls.Add($ConfirmLabel)
        $ConfirmWin.Controls.Add($ConfirmWinOKButton)
        $ConfirmWin.ShowDialog() | Out-Null
    }

# Главное окно, по хорошему тоже стоило бы оформить в виде функции
     $MainSendWindow                = New-Object System.Windows.Forms.Form
     $ToolTip = New-Object System.Windows.Forms.ToolTip

     $ToolTip.BackColor = [System.Drawing.Color]::LightGoldenrodYellow
     $ToolTip.IsBalloon = $true
     # $ToolTip.InitialDelay = 500
     # $ToolTip.ReshowDelay = 500

     # Инициализация контролов формы
     # Кнопки и чекбокс
     $SendButton                   = New-Object System.Windows.Forms.Button
     $CloseButton                   = New-Object System.Windows.Forms.Button
     $TestRunCheckBox           = New-Object System.Windows.Forms.CheckBox

     # Текстовые поля и списки
     $ServerTextBox                = New-Object System.Windows.Forms.ComboBox
     $UserTextBox                   = New-Object System.Windows.Forms.ComboBox
     $MessageTextBox             = New-Object System.Windows.Forms.TextBox
     $SignTextBox                   = New-Object System.Windows.Forms.ComboBox

     # Подписи
     $ServerTextBoxLabel           = New-Object System.Windows.Forms.Label
     $UserTextBoxLabel              = New-Object System.Windows.Forms.Label
     $MessageTextBoxLabel        = New-Object System.Windows.Forms.Label
     $SignTextBoxLabel              = New-Object System.Windows.Forms.Label

# Описываем свойства (комментариями я еще добавлю несколько нагугленных
# интересных свойств для общего развития и чтобы далеко не бегать ;))

# Главная форма
$MainSendWindow.StartPosition  = "CenterScreen"
$MainSendWindow.Text           = "Отправка сообщения пользователям"
$MainSendWindow.Width          = 470
$MainSendWindow.Height         = 220
# несколько плюшек и обещанных красивостей
#$Win.ControlBox           = 0 # отключить кнопки свернуть, минимизацию и закрытие.
# $Win.ShowIcon             = 0
# $Win.ShowInTaskbar        = 0
# $Win.HelpButton           = 1
# авторазмер может отрабатывать если вся форма - к примеру одна кнопка "Сделать хорошо"
# $Win.Autosize             = 1
# $Win.AutoSizeMode         = "GrowAndShrink"
# стиль обрамления и шрифт.
# $Win.FormBorderStyle      = [System.Windows.Forms.FormBorderStyle]::Fixed3D
# $Win.Font                 = New-Object System.Drawing.Font("Verdana",32)

# Подписи к текстовым полям
$ServerTextBoxLabel.Location   = New-Object System.Drawing.Point(10,12)
$ServerTextBoxLabel.Text       = "Список регионов"
$ServerTextBoxLabel.Autosize     = 1

$UserTextBoxLabel.Location     = New-Object System.Drawing.Point(10,42)
$UserTextBoxLabel.Text         = "Список пользователей"
$UserTextBoxLabel.Autosize     = 1

$MessageTextBoxLabel.Location  = New-Object System.Drawing.Point(10,73)
$MessageTextBoxLabel.Text      = "Заглавление"
$MessageTextBoxLabel.Autosize  = 1
# Плюшка в виде красивой подсказки, делается другим методом вызова, поэтому идет к каждому обьекту в блоке, чтобы не теряться.
$ToolTip.SetToolTip($MessageTextBoxLabel, "Надо подписаться, а то в заголовке окна с сообщениями не видно")

$SignTextBoxLabel.Location     = New-Object System.Drawing.Point(10,103)
$SignTextBoxLabel.Text         = "Сообщение"
$SignTextBoxLabel.Autosize     = 1
$ToolTip.SetToolTip($SignTextBoxLabel, "Надо подписаться, а то в заголовке окна с сообщениями не видно")

# Описание текстбокса
# Позиция
$ServerTextBox.Location        = New-Object System.Drawing.Point(140,10)
# Источник данных
$ServerTextBox.DataSource      = $Server
# Размер
$ServerTextBox.Width           = 300
# Обработка события - при смене текста в поле, присваиваем переменной новое полученное значение.
$ServerTextBox.add_TextChanged({ $Server = $ServerTextBox.Text })
# индекс порядка перехода по Tab
$ServerTextBox.TabIndex        = 1
$ToolTip.SetToolTip($ServerTextBox, "Укажите список серверов")

$UserTextBox.Location          = New-Object System.Drawing.Point(140,40)
$UserTextBox.DataSource        = $User
# Не забываем про массив
$UserTextBox.Text              = $User[1]
$UserTextBox.add_TextChanged({ $User = $UserTextBox.Text })
$UserTextBox.Width             = 300
$UserTextBox.TabIndex          = 2
$ToolTip.SetToolTip($UserTextBox, "От какого имени отправлять будем? (* по умолчанию)")

# Поле сообщения
$MessageTextBox.Location       = New-Object System.Drawing.Point(140,70)
$MessageTextBox.Text           = $Message
# По клику в поле ввода - автоматически выделяем весь текст, чтобы не надо было
# нажимать удаление
$MessageTextBox.add_click({ $MessageTextBox.SelectAll() })
$MessageTextBox.add_TextChanged( { $Message = $MessageTextBox.Text })
$MessageTextBox.Width          = 300
$MessageTextBox.TabIndex       = 3
$ToolTip.SetToolTip($MessageTextBox, "И шо мы таки хотим сказать?")

# Поле подписи - отправляемая переменная уже другая
$SignTextBox.Location          = New-Object System.Drawing.Point(140,103)
# Источник текста для подписи
$SignTextBox.DataSource        = $Sign
# А мы помним, что там массив?:)
$SignTextBox.Text              = $Sign[1]
$SignTextBox.add_TextChanged({ $SignX = $SignTextBox.Text })
$SignTextBox.Width             = 300
$SignTextBox.TabIndex          = 4
$ToolTip.SetToolTip($SignTextBox, "Страна должна знать своих героев")

# Нопка отправки.
$SendButton.Location           = New-Object System.Drawing.Point(10,150)
$SendButton.Text               = "Отправить сообщение"
# Выполняем разделения строк на массивы с разделителем запятая, вызываем функцию отправки сообщения
$SendButton.add_click({ $User  = $UserTextBox.Text.Split(","); $Server = $ServerTextBox.Text.Split(","); $SignX = $SignTextBox.Text; SendMessage $Server $User $Message $SignX} )
$SendButton.Autosize           = 1
$SendButton.TabIndex           = 5
$ToolTip.SetToolTip($SendButton, "Тыцни пимпочку")

# Прописываем блокировочный чекбокс
$TestRunCheckBox.Location      = New-Object System.Drawing.Point(200,150)
$TestRunCheckBox.Text          = "Тест"
$TestRunCheckBox.Checked       = 1
$TestRunCheckBox.AutoSize      = 1
$TestRunCheckBox.TabIndex      = 6
$ToolTip.SetToolTip($TestRunCheckBox, "Сними меня, а то работать не будет")

# Кнопочка выхода, по событию вызывает метод закрытия
$CloseButton.Location          = New-Object System.Drawing.Point(315,150)
$CloseButton.Text              = "Выйти из программы"
$CloseButton.add_click({ $MainSendWindow.Close() })
$CloseButton.Autosize          = 1
$CloseButton.TabIndex          = 7
$ToolTip.SetToolTip($CloseButton, "Пойдем ка отсюда")

# Добавляем верхнее меню в форму*
$Menu = New-Object System.Windows.Forms.MainMenu
$menuItem1= New-Object System.Windows.Forms.menuItem
$menuItem2= New-Object System.Windows.Forms.menuItem
$menuItem3= New-Object System.Windows.Forms.menuItem

$Menu.MenuItems.Add($menuItem1)
$menuItem1.MenuItems.Add($menuItem2)
$Menu.MenuItems.Add($menuItem3)
$menuItem1.Text= 'Меню 1'
$menuItem2.Text= 'Подменю'
$menuItem3.Text= 'Меню 3'

# Добавляем контролы в форму и вызываем её запуск
$MainSendWindow.Menu= $Menu

$MainSendWindow.Controls.Add($SendButton)
$MainSendWindow.Controls.Add($TestRunCheckBox)
$MainSendWindow.Controls.Add($CloseButton)

$MainSendWindow.Controls.Add($ServerTextBox)
$MainSendWindow.Controls.Add($UserTextBox)
$MainSendWindow.Controls.Add($MessageTextBox)
$MainSendWindow.Controls.Add($SignTextBox)

$MainSendWindow.Controls.Add($ServerTextBoxLabel)
$MainSendWindow.Controls.Add($UserTextBoxLabel)
$MainSendWindow.Controls.Add($MessageTextBoxLabel)
$MainSendWindow.Controls.Add($SignTextBoxLabel)

$MainSendWindow.ShowDialog() | Out-Null